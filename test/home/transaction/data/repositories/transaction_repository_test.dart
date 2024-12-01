import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spend/features/common/app_base_response.dart';
import 'package:spend/features/home/transaction/data/model/transaction_response.dart';
import 'package:spend/features/home/transaction/data/repositories/transaction_repositories.dart';
import 'package:spend/network/app_config.dart';

import 'transaction_repository_test.mocks.dart';


// class MockDio extends Mock implements Dio {
//
// }

@GenerateMocks([Dio])
void main() {
  late TransactionRepository transactionRepository;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    transactionRepository = TransactionRepository(dio: mockDio);
  });


  group('FetchCrypto', () {
    test('returns TransactionRepository when successful', () async {
      when(mockDio.get(AppConfig.getLatestBlock))
          .thenAnswer((_) async =>
          Response(data: "",
              statusCode: 200,
              requestOptions: RequestOptions()));

      final result = await transactionRepository.getLatestBlock();
      result.fold(
            (l) => null,
            (r) {
          expect(r, isA<AppBaseResponse>());
        },
      );
    });

    test('returns error message when fails', () async {
      when(mockDio.get(AppConfig.getLatestBlock))
          .thenAnswer((_) async =>
          Response(statusCode: 400, requestOptions: RequestOptions()));

      final result = await transactionRepository.getLatestBlock();
      result.fold(
            (l) {
          expect(l, isA<String>());
        },
            (r) => null,
      );
    });

    test('fetchInventory throws and Exception', () async {
      when(mockDio.get(AppConfig.getLatestBlock)).thenThrow(DioException(
        requestOptions: RequestOptions(),
        type: DioExceptionType.connectionTimeout,
      ));
      final result = await transactionRepository.getLatestBlock();
      result.fold(
            (l) {
          expect(l, isA<String>());
        },
            (r) => null,
      );
    });
  });
  group('FetchCryptoByHash', () {
    test('returns TransactionRepository when successful', () async {
      when(mockDio.get(AppConfig.getTxnByHash("0000000000000000000134caea3cb6b375fc75b633934efc1438bf4418d9fdd9")))
          .thenAnswer((_) async =>
          Response(data: {"hash":"0000000000000000000134caea3cb6b375fc75b633934efc1438bf4418d9fdd9",
          "time":1732970827,
          "bits":386056304},
              statusCode: 200,
              requestOptions: RequestOptions()));

      final result = await transactionRepository.getTxnByHash(hash: "0000000000000000000134caea3cb6b375fc75b633934efc1438bf4418d9fdd9");
      result.fold(
            (l) => null,
            (r) {
          expect(r, isA<TransactionResponse>());
        },
      );
    });

    test('returns error message when fails', () async {
      when(mockDio.get(AppConfig.getTxnByHash("0000000000000000000134caea3cb6b375fc75b633934efc1438bf4418d9fdd9")))
          .thenAnswer((_) async =>
          Response(statusCode: 400, requestOptions: RequestOptions()));

      final result = await transactionRepository.getTxnByHash(hash: "0000000000000000000134caea3cb6b375fc75b633934efc1438bf4418d9fdd9");
      result.fold(
            (l) {
          expect(l, isA<String>());
        },
            (r) => null,
      );
    });

    test('fetchInventory throws and Exception', () async {
      when(mockDio.get(AppConfig.getTxnByHash("0000000000000000000134caea3cb6b375fc75b633934efc1438bf4418d9fdd9"))).thenThrow(DioException(
        requestOptions: RequestOptions(),
        type: DioExceptionType.connectionTimeout,
      ));
      final result = await transactionRepository.getTxnByHash(hash: "0000000000000000000134caea3cb6b375fc75b633934efc1438bf4418d9fdd9");
      result.fold(
            (l) {
          expect(l, isA<String>());
        },
            (r) => null,
      );
    });
  });
}