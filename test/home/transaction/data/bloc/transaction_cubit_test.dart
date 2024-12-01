
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spend/features/common/app_base_response.dart';
import 'package:spend/features/home/transaction/data/bloc/transaction_cubit.dart';
import 'package:spend/features/home/transaction/data/model/transaction_response.dart';
import 'package:spend/features/home/transaction/data/repositories/transaction_repositories.dart';
import 'package:spend/features/utils/helper.dart';

import 'transaction_cubit_test.mocks.dart';
// class MockTransactionRepository extends Mock implements TransactionRepository {}

@GenerateMocks([TransactionRepository])
void main() {
  late TransactionCubit transactionCubit;
  late MockTransactionRepository mockTransactionRepository;

  setUp(() {
    mockTransactionRepository = MockTransactionRepository();
    transactionCubit = TransactionCubit(transactionRepository: mockTransactionRepository);
  });

  tearDown(() {
    transactionCubit.close();
  });
  test('initial state is correct', () {
    expect(transactionCubit.state, TransactionInitial());
  });

  group('fetchCryptoHash', () {
    blocTest<TransactionCubit, TransactionState>(
      'fetchCryptoHash emits [Loading, FetchHash] when successful',
      build: () => transactionCubit,
      setUp: () {
        when(mockTransactionRepository.getLatestBlock()).thenAnswer((_) async => Right(AppBaseResponse(message: "0000000000000000000134caea3cb6b375fc75b633934efc1438bf4418d9fdd9")));
      },
      act: (cubit) => cubit.getLatestBlock(),
      expect: () => <TransactionState>[
       const Loading(),
        FetchedHash(appBaseResponse: AppBaseResponse(message: '0000000000000000000134caea3cb6b375fc75b633934efc1438bf4418d9fdd9')),
      ],
    );

    blocTest<TransactionCubit, TransactionState>(
      'fetchCryptoHash emits [Loading, TxnError] when fails',
      build: () => transactionCubit,
      setUp: () {
        when(mockTransactionRepository.
            getLatestBlock()).thenAnswer((_) async => const Left('Error message'));
      },
      act: (cubit) => cubit.getLatestBlock(),
      expect: () => <TransactionState>[
       const Loading(),
         TxnError(error: 'Error message'),
      ],
    );
    blocTest<TransactionCubit, TransactionState>(
      'fetchCryptoHash emits [Loading, TxnError] when it throws an exception',
      build: () => transactionCubit,
      setUp: () {
        when(mockTransactionRepository.getLatestBlock()).thenThrow(Exception('Failed fetch crypto'));
      },
      act: (cubit) => cubit.getLatestBlock(),
      expect: () => <TransactionState>[
       const Loading(),
        TxnError(error: Exception('Failed fetch crypto').toString()),
      ],
    );
  });


  group('fetchCryptoByHash', () {
    blocTest<TransactionCubit, TransactionState>(
      'fetchCryptoByHash emits [Loading, FetchedSuccessfully] when successful',
      build: () => transactionCubit,
      setUp: () {
        when(mockTransactionRepository.getTxnByHash(hash: "0000000000000000000134caea3cb6b375fc75b633934efc1438bf4418d9fdd9"))
            .thenAnswer((_) async => Right(TransactionResponse.fromJson({'txn':response} )));
      },
      act: (cubit) => cubit.getTxnByHash(hash:"0000000000000000000134caea3cb6b375fc75b633934efc1438bf4418d9fdd9"),
      expect: () => <TransactionState>[
        Loading(),
        FetchedSuccessfully(transactionResponse: TransactionResponse.fromJson({'txn':response})),
      ],
    );

    blocTest<TransactionCubit, TransactionState>(
      'fetchCryptoHash emits [Loading, TxnError] when fails',
      build: () => transactionCubit,
      setUp: () {
        when(mockTransactionRepository.getTxnByHash(hash: "0000000000000000000134caea3cb6b375fc75b633934efc1438bf4418d9fdd9"))
            .thenAnswer((_) async => const Left('Error message'));
      },
      act: (cubit) => cubit.getTxnByHash(hash: "0000000000000000000134caea3cb6b375fc75b633934efc1438bf4418d9fdd9"),
      expect: () => <TransactionState>[
        Loading(),
        TxnError(error: 'Error message'),
      ],
    );
    blocTest<TransactionCubit, TransactionState>(
      'fetchCryptoHash emits [Loading, TxnError] when it throws an exception',
      build: () => transactionCubit,
      setUp: () {
        when(mockTransactionRepository.getTxnByHash(hash: "0000000000000000000134caea3cb6b375fc75b633934efc1438bf4418d9fdd9")).thenThrow(Exception('Failed fetch crypto'));
      },
      act: (cubit) => cubit.getTxnByHash(hash:"0000000000000000000134caea3cb6b375fc75b633934efc1438bf4418d9fdd9" ),
      expect: () => <TransactionState>[
        Loading(),
        TxnError(error: Exception('Failed fetch crypto').toString()),
      ],
    );
  });

}