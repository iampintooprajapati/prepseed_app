import 'package:equatable/equatable.dart';
import 'package:prepseed_app/models/auth_model.dart';

abstract class RegisterEvent extends Equatable {}

class RegisterSubmitEvent extends RegisterEvent {
  AuthModel authModel;
  RegisterSubmitEvent({required this.authModel});
  @override
  List<Object?> get props => [authModel];
}
