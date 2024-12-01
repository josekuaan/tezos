import 'package:equatable/equatable.dart';

class AppBaseResponse extends Equatable{
  AppBaseResponse({this.message,this.success});

  String? message;
  String ?success;

  @override
  List<Object?> get props => [message,success];
}