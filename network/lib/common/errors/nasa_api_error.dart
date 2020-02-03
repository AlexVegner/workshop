import 'dart:io';

class NasaApiError extends HttpException {
  final int code;
  final String method;
  final String body;

  NasaApiError({
    String message = 'NasaApiError',
    this.method,
    Uri uri,
    this.body,
    this.code,
  }) : super(message, uri: uri);

  String toString() {
    var b = new StringBuffer()..write('NasaApiError: ')..write(message);
    if (method != null) {
      b.write(', method = $method');
    }
    if (uri != null) {
      b.write(', uri = $uri');
    }
    if (body != null) {
      b.write(', body = $body');
    }
    return b.toString();
  }
}
