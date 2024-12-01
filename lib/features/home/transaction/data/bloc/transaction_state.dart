part of 'transaction_cubit.dart';

@immutable
sealed class TransactionState extends Equatable {
  const TransactionState();
}

final class TransactionInitial extends TransactionState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class Loading extends TransactionState {
  const Loading();
  @override
  List<Object> get props => [];
}

class FetchedSuccessfully extends TransactionState{
  TransactionResponse transactionResponse;
  FetchedSuccessfully({required this.transactionResponse});
  @override
  List<Object> get props => [transactionResponse];
}
class FetchedHash extends TransactionState{
  AppBaseResponse appBaseResponse;
  FetchedHash({required this.appBaseResponse});
  @override
  List<Object> get props => [appBaseResponse];
}
class TxnError extends TransactionState {
  final String error;
  TxnError({required this.error});
  @override
  List<Object> get props => [error];
}
