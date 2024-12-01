import 'package:dio/dio.dart';
import 'package:spend/session_manager/session_manager.dart';

import 'network_provider.dart';

class AppInterceptors extends Interceptor {
SessionManager sessionManager = SessionManager();
NetworkProvider httpMethods = NetworkProvider();
AppInterceptors();
@override
void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  var token = sessionManager.tokenVal;
  print("+===================================");

  print("======================================");

  if (sessionManager.tokenVal.isNotEmpty) {
    options.headers.addAll({
      "Authorization": "Bearer " + token,
      "Accept": "*/*",
      "Connection": "Keep-alive",
      "Content-type": "application/json"
    });
  } else {
    options.headers.addAll({
      "Accept": "*/*",
      "Connection": "Keep-alive",
      "Content-type": "application/json; charset=utf-8",
      "Access-Control-Allow-Origin": "*"
    });
  }
  print('REQUEST[${options.method}] => HEADER: ${options.headers}');
  print('REQUEST[${options.method}] => DATA: ${options.data}');
  print('REQUEST[${options.method}] => PATH: ${options.path}');
  print('REQUEST[${options.method}] => QUERY: ${options.queryParameters}');
  return super.onRequest(options, handler);
}

@override
void onResponse(Response response, ResponseInterceptorHandler handler) {
  print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
  print('${response.headers}');
  print('RESPONSE STATUSCODE[${response.statusCode}] => BODY: ${response}');

  if (response.data != null && response.data.toString().isNotEmpty) {
    response.data = response.data;
  }
  if (response.statusCode! >= 200 && response.statusCode! < 400) {
    response.statusCode = 200;
    response.data = response.data;
  }
  return super.onResponse(response, handler);
}

@override
void onError(DioError err, ErrorInterceptorHandler handler) {
  print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');

  // if (err.response!.statusCode == 401) {
  //   print(err.response!.statusCode);
  //   httpMethods
  //       .call(
  //           data: jsonEncode({"token": sessionManager.refreshTokenVal}),
  //           path: AppConfig.refreshToken,
  //           method: RequestMethod.post)
  //       .then((value) async {
  //     print(value!.statusCode);
  //     if (value.statusCode == 201) {
  //
  //
  //       sessionManager.tokenVal = value.data['data']['token'];
  //       err.requestOptions.headers["Authorization"] =
  //           "Bearer " + value.data['data']['token'];
  //
  //       final opts = new Options(method: err.requestOptions.method, headers: {
  //         "Authorization": "Bearer " + value.data['data']['token'],
  //         "Accept": "*/*",
  //         "business-id": sessionManager.businessUuIdVal,
  //         "auth-pin":
  //             sessionManager.pinVal.isNotEmpty ? sessionManager.pinVal : "",
  //         "Connection": "Keep-alive",
  //         "Content-type": "application/json"
  //       });
  //
  //       final cloneReq = await Dio().request(err.requestOptions.path,
  //           options: opts,
  //           data: err.requestOptions.data,
  //           queryParameters: err.requestOptions.queryParameters);
  //
  //       // return handler.resolve(cloneReq);
  //     }
  //   });
  //   // return err;
  // }
  return super.onError(err, handler);
  // _retry(err.requestOptions);
}
}

// Future<void> refreshToken() async {
//   await httpMethods.call(
//       data: jsonEncode(sessionManager.refreshTokenVal),
//       path: NetworkConfig.refreshToken,
//       method: RequestMethod.post);
// }

// Future<Response> _retry(RequestOptions requestOptions) async {
//   // final options = new Options(
//   //   method: requestOptions.method,
//   //   headers: requestOptions.headers,
//   // );
//   httpMethods.call(
//       data: jsonEncode(requestOptions.data),
//       path: requestOptions.path,
//       method: RequestMethod.post);
//   return;
// }
