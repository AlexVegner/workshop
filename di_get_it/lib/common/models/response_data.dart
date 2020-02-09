class ResponseData {
  static const String DATA = 'data';
  static const String ERROR = 'error';

  final Map<String, dynamic> data;
  final ResponseError error;

  ResponseData({
    this.data,
    this.error,
  });

  ResponseData.fromJson(Map<String, dynamic> json)
      : data = json[DATA],
        error =
            json[ERROR] == null ? null : ResponseError.fromJson(json[ERROR]);

  Map<String, dynamic> toJson() => {
        DATA: data,
        ERROR: error.toJson(),
      };
}

class ResponseError {
  static const String CODE = 'code';
  static const String KEY = 'key';
  static const String MESSAGE = 'message';

  final int code;
  final String key;
  final String message;

  ResponseError({this.code, this.key, this.message});

  ResponseError.fromJson(Map<String, dynamic> json)
      : code = json[CODE],
        key = json[KEY],
        message = json[MESSAGE];

  Map<String, dynamic> toJson() => {
        CODE: code,
        KEY: key,
        MESSAGE: message,
      };
}
