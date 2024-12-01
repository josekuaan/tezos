import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spend/features/common/app_base_response.dart';
import 'package:spend/features/home/transaction/data/model/transaction_response.dart';
import 'package:spend/network/api_error.dart';
import 'package:spend/network/app_config.dart';
import 'package:spend/network/network_provider.dart';

class TransactionRepository {
  var networkProvider = NetworkProvider();
  TransactionRepository({required this.dio})
      : _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(minutes: 500),
      receiveTimeout: const Duration(minutes: 500),
    ),
  );

  final Dio dio;

  final Dio _dio;
  Future<Either<String, AppBaseResponse>> getLatestBlock() async {
    try {
      final response = await _dio.get(
           AppConfig.getLatestBlock);

      if (response.statusCode == 200) {
        AppBaseResponse appBaseResponse=AppBaseResponse(message:response.data['hash']);
        return Right(appBaseResponse);
      } else {
        return Left(response.statusMessage??"Network Error");
      }
    } on DioException catch (e) {
      return Left(Apierror.fromDio(e).errorDescription);
    }
  }
  Future<Either<String, TransactionResponse>> getTxnByHash({required String hash}) async {
    try {
      final response = await _dio.get(
           AppConfig.getTxnByHash(hash));

      if (response.statusCode == 200) {
        TransactionResponse transactionResponse=TransactionResponse.fromJson({'txn':response.data['tx']});
        return Right(transactionResponse);
      } else {
        return Left(response.statusMessage?? "Network Error");
      }
    } catch (e) {
      return Left(Apierror.fromDio(e).errorDescription);
    }
  }

}