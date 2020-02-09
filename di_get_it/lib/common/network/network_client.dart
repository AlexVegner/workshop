import 'dart:convert';
import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:storage/common/errors/api_error.dart';
import 'package:storage/common/models/response_data.dart';
import 'package:storage/data/auth/datasources/session_manager.dart';
import 'package:path/path.dart';

import 'package:http/http.dart' as http;

import 'http_constants.dart';

abstract class NetworkClient {
  Future<ResponseData> get(url, {Map<String, String> headers});

  Future<ResponseData> post(String url,
      {Map<String, String> headers, body, Encoding encoding});

  Future<ResponseData> put(String url,
      {Map<String, String> headers, body, Encoding encoding});

  Future<ResponseData> delete(String url, {Map<String, String> headers});

  Future<http.Response> postMultipart(String url,
      {Map<String, String> headers,
      Map<String, String> body,
      String fileField,
      File file,
      Encoding encoding});
}

class NetworkClientImpl extends NetworkClient {
  final http.Client client;
  final SessionManager sessionManager;

  NetworkClientImpl({@required this.client, @required this.sessionManager});

  @override
  Future<ResponseData> get(url, {Map<String, String> headers}) async {
    final uri = Uri.encodeFull(url);
    final request =
        () async => client.get(uri, headers: await _addServiceHeaders(headers));

    return await _handleResponse(
      request: request,
      url: url,
      httpResponse: await request(),
    );
  }

  @override
  Future<ResponseData> post(String url,
      {Map<String, String> headers, body, Encoding encoding}) async {
    final request = () async => client.post(Uri.encodeFull(url),
        headers: await _addServiceHeaders(headers),
        body: body,
        encoding: encoding);
    return _handleResponse(
      request: request,
      url: url,
      httpResponse: await request(),
      requestBody: body,
    );
  }

  @override
  Future<ResponseData> delete(String url, {Map<String, String> headers}) async {
    final request = () async => client.delete(Uri.encodeFull(url),
        headers: await _addServiceHeaders(headers));

    return _handleResponse(
      request: request,
      url: url,
      httpResponse: await request(),
    );
  }

  @override
  Future<ResponseData> put(String url,
      {Map<String, String> headers, body, Encoding encoding}) async {
    final request = () async => client.put(Uri.encodeFull(url),
        headers: await _addServiceHeaders(headers),
        body: body,
        encoding: encoding);

    return await _handleResponse(
      request: request,
      url: url,
      httpResponse: await request(),
      requestBody: body,
    );
  }

  @override
  Future<http.Response> postMultipart(String url,
      {Map<String, String> headers,
      Map<String, String> body,
      String fileField,
      File file,
      Encoding encoding}) async {
    final multipartRequest = () async {
      final uri = Uri.parse(url);
      final request = new http.MultipartRequest(HttpMethod.POST, uri);
      request.headers.addAll(await _addServiceHeaders(headers));
      if (body != null) {
        request.fields.addAll(body);
      }
      if (fileField != null && file != null) {
        request.files.add(await http.MultipartFile.fromPath(
            fileField, file.path,
            filename: basename(file.path)));
      }
      return request.send().then(http.Response.fromStream);
    };

    return await _handleMultipart(
      httpResponse: await multipartRequest(),
      url: url,
      request: multipartRequest,
      requestBody: body,
    );
  }

  Future<String> _getAuthorizationToken() async {
    return (await sessionManager.getSession())?.token ?? '';
  }

  Future<Map<String, String>> _addServiceHeaders(
      Map<String, String> headers) async {
    final String token = await _getAuthorizationToken();
    final Map<String, String> resultHeaders = Map();
    if (token != null) {
      resultHeaders[HttpHeaders.authorizationHeader] = token;
    }
    if (headers != null) {
      resultHeaders.addAll(headers);
    }
    return resultHeaders;
  }

  String mapToQuery(Map<String, dynamic> map) {
    final buffer = StringBuffer();
    map.forEach((key, value) {
      if (value != null) {
        if (buffer.isEmpty) {
          buffer.write('?');
        } else {
          buffer.write('&');
        }
        buffer..write(key)..write('=')..write(value);
      }
    });
    return buffer.toString();
  }

  String urlWithQuery(String url, {@required Map<String, dynamic> query}) {
    return url + mapToQuery(query);
  }

  ApiError _getHttpError(
    http.Response response,
    String url, {
    String requestBody,
  }) {
    return ApiError(
      uri: Uri.parse(url),
      body: response.body,
      code: response.statusCode,
      message: response.reasonPhrase,
      method: response.request.method,
      requestBody: requestBody,
    );
  }

  Future<http.Response> _handleMultipart({
    @required http.Response httpResponse,
    @required final request,
    String url,
    final requestBody,
  }) async {
    if (httpResponse.statusCode >= 200 &&
        httpResponse.statusCode < 300 &&
        httpResponse.statusCode != 205) {
      return httpResponse;
    }

    _isTokenInvalid(httpResponse);

    throw _getHttpError(httpResponse, url, requestBody: requestBody.toString());
  }

  ResponseData _handleResponse({
    @required http.Response httpResponse,
    @required final request,
    String url,
    final requestBody,
  }) {
    if (httpResponse.statusCode >= 200 && httpResponse.statusCode < 300) {
      final ResponseData res =
          ResponseData.fromJson(json.decode(httpResponse.body));
      if (res?.data != null) {
        final bool hasError = res.error != null;
        if (!hasError) {
          return res;
        } else {
          final su = Uri.parse(url);
          if (!_isTokenInvalid(httpResponse)) {
            throw ApiError(
              message: res.error?.message ?? '',
              uri: su,
              responseError: res.error,
              code: httpResponse.statusCode,
            );
          }
        }
      }
    }
    if (httpResponse.statusCode >= 400 && httpResponse.statusCode < 500) {
      final ResponseData res =
          ResponseData.fromJson(json.decode(httpResponse.body));
      if (!_isTokenInvalid(httpResponse)) {
        final error = res?.error;
        if (error != null) {
          throw ApiError(
            message: res.error?.message ?? '',
            uri: Uri.parse(url),
            responseError: error,
            code: httpResponse.statusCode,
          );
        }
      }
    }
    throw _getHttpError(httpResponse, url);
  }

  bool _isTokenInvalid(http.Response httpResponse) {
    if (httpResponse.statusCode == 401) {
      // TODO Logout
      return true;
    } else {
      return false;
    }
  }
}
