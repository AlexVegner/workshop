abstract class HttpMethod {
  static const String GET = "GET";
  static const String POST = "POST";
  static const String PUT = "PUT";
  static const String DELETE = "DELETE";
  static const String PATH = "PATCH";
}

abstract class AppHeaders {
  static const CONTENT_TYPE_KEY = 'content-type';
  static const JSON_HEADER = "application/json";
  static const FORM_ENCODED_HEADER = "application/x-www-form-urlencoded";
}
