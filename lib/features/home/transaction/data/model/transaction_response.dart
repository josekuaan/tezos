import 'package:equatable/equatable.dart';

class TransactionResponse extends Equatable{

  List<TxnList>? txnList;
  TransactionResponse(
      this.txnList,
      );

  TransactionResponse.fromJson(Map<String,dynamic>json){

    txnList = List<TxnList>.from(
        json['txn'].map((e) => TxnList.fromJson(e)));

  }

  @override
  List<Object?> get props => [txnList];
}

class TxnList extends Equatable{
String? hash;
int?time;
int?size;
int?height;
int?blockIndex;
TxnList({
  this.hash,
  this.time,
  this.size,
  this.height,
  this.blockIndex,
});
TxnList.fromJson(Map<String,dynamic>json){

    hash=json['hash'];
    time=json['time'];
    size=json['size'];
    height=json['height'];
    blockIndex=json['block_index'];
  }

  @override
  // TODO: implement props
  List<Object?> get props => [hash,time,size,height,blockIndex];
}