import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prepseed_app/bloc/register/register_event.dart';
import 'package:prepseed_app/bloc/register/register_state.dart';
import 'package:prepseed_app/repository/auth_repo.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  AuthRepo repo = AuthRepoImpl();

  RegisterBloc(this.repo) : super(RegisterInitialState()) {
    on<RegisterSubmitEvent>(_onRegisterSubmit);
  }

  _onRegisterSubmit(
      RegisterSubmitEvent event, Emitter<RegisterState> emit) async {
    try {
      emit(RegisterLoadingState());
      dynamic jsonData;
      jsonData = await repo.register(event.authModel);
      dynamic data = jsonDecode(jsonData['token']);
      await data;
      emit(RegisterSuccessState(
        msg: jsonData['message'],
      ));
    } catch (e) {
      emit(
        RegisterErrorState(
          msg: e.toString(),
        ),
      );
    }
  }
}
