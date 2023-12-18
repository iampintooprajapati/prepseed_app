import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:prepseed_app/bloc/login/auth_event.dart';
import 'package:prepseed_app/bloc/login/auth_state.dart';
import 'package:prepseed_app/repository/auth_repo.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepo repo = AuthRepoImpl();

  AuthBloc() : super(AuthInitialState()) {
    on<AuthSubmitEvent>(_onAuthSubmit);
  }

  _onAuthSubmit(AuthSubmitEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoadingState());
      dynamic jsonData;
      jsonData = await repo.login(event.loginModel);
      dynamic data = jsonDecode(jsonData['token']);
      await data;
      emit(AuthSuccessState(
        msg: jsonData['message'],
      ));
    } catch (e) {
      emit(
        AuthErrorState(
          msg: e.toString(),
        ),
      );
    }
  }
}
