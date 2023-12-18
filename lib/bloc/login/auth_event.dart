import 'package:equatable/equatable.dart';
import 'package:prepseed_app/models/auth_model.dart';

abstract class AuthEvent extends Equatable {}

class AuthSubmitEvent extends AuthEvent {
  AuthModel loginModel;
  AuthSubmitEvent({required this.loginModel});
  @override
  List<Object?> get props => [loginModel];
}
