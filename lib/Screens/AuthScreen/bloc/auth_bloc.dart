import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    onChange(change) {
      print(change.toString());
    }

    on<OnClickEmailContinueButton>(onClickEmailContinueButton);
  }

  FutureOr<void> onClickEmailContinueButton(
      OnClickEmailContinueButton event, Emitter<AuthState> emit) {
    emit(AuthLoading());
    if (event.isEmailFilled == true) {
      emit(AuthSuccess());
    }
  }
}
