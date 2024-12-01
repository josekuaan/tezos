import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:spend/features/common/app_base_response.dart';
import 'package:spend/features/home/transaction/data/model/transaction_response.dart';
import 'package:spend/features/home/transaction/data/repositories/transaction_repositories.dart';


part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  final TransactionRepository _transactionRepository;
  TransactionCubit({TransactionRepository? transactionRepository}) :
        _transactionRepository = transactionRepository ?? TransactionRepository(dio: Dio()),
        super(TransactionInitial());

  getLatestBlock()async{

  try {
    emit(const Loading());

    Either<String, AppBaseResponse>   res= await _transactionRepository.getLatestBlock();

    res.fold((l) => emit(TxnError(error: l)), (r) {
      emit(FetchedHash(appBaseResponse: r));
    });
  } catch (e) {
    emit(TxnError(error: e.toString()));
  }
  }

  getTxnByHash({required String hash})async{

    try {
      emit(const Loading());

      Either<String, TransactionResponse>   res= await _transactionRepository.getTxnByHash(hash:hash);

      res.fold((l) => emit(TxnError(error: l)), (r) {
        emit(FetchedSuccessfully(transactionResponse: r));
      });
    } catch (e) {
      emit(TxnError(error: e.toString()));
    }
  }
}
