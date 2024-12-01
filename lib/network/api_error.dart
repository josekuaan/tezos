import 'package:dio/dio.dart';

class Apierror {
  late String errorDescription;
  // ApiErrorModel? apiErrorModel;

  Apierror({required this.errorDescription});

  Apierror.fromDio(Object dioError) {
    _handleError(dioError);
  }

  void _handleError(Object error) {
    if (error is DioException) {
      var dioError = error;
      switch (dioError.type) {
        case DioExceptionType.cancel:
          errorDescription = "Request was Canceled";
          break;
        case DioExceptionType.sendTimeout:
          errorDescription = "Send Timeout";
          break;
        case DioExceptionType.connectionError:
          errorDescription = "Connection Error:check your network connection";
          break;
        case DioExceptionType.connectionTimeout:
          errorDescription = "Connect Timeout";
          break;
        case DioExceptionType.receiveTimeout:
          errorDescription = "Received Timeout";
          break;
        case DioExceptionType.unknown:
          errorDescription = "Connection failed";
          break;
        case DioExceptionType.badResponse:
          print("error.response!.");
          print(dioError.response!.statusCode);
          print(dioError.response!);

          if (dioError.response!.statusCode == 400) {
            errorDescription = error.response!.data["message"];
          }else if (dioError.response!.statusCode == 404) {
            errorDescription = error.response!.data["message"];
          } else if (dioError.response!.statusCode == 401) {
            errorDescription = error.response!.data["message"];
          } else if (dioError.response!.statusCode == 502) {
            errorDescription = "Bad Gateway";
          } else if (dioError.response!.statusCode == 500) {
            errorDescription = error.response!.data["message"]!;
          } else if (dioError.response!.statusCode == 403) {
            errorDescription = error.response!.data["message"];
          } else {
            errorDescription = "Something went wrong";
          }
          break;
        default:
      }
    }
  }

  @override
  String toString() => errorDescription;
}
