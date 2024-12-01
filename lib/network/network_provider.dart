import 'package:dio/dio.dart';

import 'api_error.dart';
import 'app_interceptors.dart';

class NetworkProvider {
  Dio _getDioInstance() {
    var dio = Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 500),
        receiveTimeout: const Duration(seconds: 500)));
    dio.interceptors.add(AppInterceptors());

    return dio;
  }

  Future<Response?> call(
      {required String path,
      required RequestMethod method,
      dynamic data = const {},
        Map<String, dynamic> headers = const {},
        Map<String, dynamic> queryParams = const {}}) async {
    Response? response;

    try {
      switch (method) {
        case RequestMethod.get:
          response =
          await _getDioInstance().get(path, queryParameters: queryParams,options: Options(headers:headers));

          break;
        case RequestMethod.post:
          response = await _getDioInstance()
              .post(path, data: data, queryParameters: queryParams,options: Options(headers:headers));
          break;
        case RequestMethod.put:
          response = await _getDioInstance()
              .put(path, data: data, queryParameters: queryParams,options: Options(headers:headers));

          break;
        case RequestMethod.patch:
          response = await _getDioInstance()
              .patch(path, data: data, queryParameters: queryParams,options: Options(headers:headers));
          break;
        case RequestMethod.delete:
          response = await _getDioInstance()
              .delete(path, queryParameters: queryParams,options: Options(headers:headers));
          break;
        default:
      }
      return response;
    }  catch (e) {
      print('=================');
      print(e);
      print('==================');
      return Future.error(Apierror.fromDio(e));
    }
  }
}

enum RequestMethod { get, post, put, patch, delete }
