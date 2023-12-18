import 'package:equatable/equatable.dart';
import 'package:prepseed_app/models/auth_model.dart';

abstract class RegisterState extends Equatable {}

class RegisterInitialState extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterSuccessState extends RegisterState {
  String msg;
  RegisterSuccessState({required this.msg});
  @override
  List<Object?> get props => [msg];
}

class RegisterLoadingState extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterErrorState extends RegisterState {
  String msg;
  RegisterErrorState({required this.msg});
  @override
  List<Object?> get props => [msg];
  @override
  String toString() {
    return msg;
  }
}
