import 'package:equatable/equatable.dart';
import 'package:prepseed_app/models/auth_model.dart';

abstract class AuthState extends Equatable {}

class AuthInitialState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthSuccessState extends AuthState {
  String msg;
  AuthSuccessState({required this.msg});
  @override
  List<Object?> get props => [msg];
}

class AuthLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthErrorState extends AuthState {
  String msg;
  AuthErrorState({required this.msg});
  @override
  List<Object?> get props => [msg];
  @override
  String toString() {
    return msg;
  }
}

class AuthRegisterState extends AuthState {
  AuthModel loginModel;
  AuthRegisterState({required this.loginModel});
  @override
  List<Object?> get props => [loginModel];
}
