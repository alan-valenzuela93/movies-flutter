
class HttpResponse {
  final dynamic data;
  final HttpError? error;

  HttpResponse(this.data, this.error);

  static HttpResponse success(dynamic data) => HttpResponse(data, null);

  static HttpResponse fail(
      {required int statusCode,
        required dynamic data,
        required String message}) =>
      HttpResponse(
          null,
          HttpError(
            statusCode: statusCode,
            data: data,
            message: message,
          ));
}

class HttpError {
  final int statusCode;
  final String message;
  final dynamic data;

  HttpError(
      {required this.statusCode, required this.data, required this.message});
}
