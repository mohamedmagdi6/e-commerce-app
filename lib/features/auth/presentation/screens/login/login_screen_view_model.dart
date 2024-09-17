import 'package:e_commerce_app/domain/use_cases/login_use_case.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/login/login_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginScreenViewModel extends Cubit<LoginScreenStates> {
  LoginUseCase loginUseCase;
  var emailaController = TextEditingController();
  var passwordController = TextEditingController();
  LoginScreenViewModel(
      {required this.loginUseCase, required LoginUseCase registerUseCase})
      : super(LoginScreenInitState());

  void logIn() async {
    emit(LoginScreenLoadingState());
    var either = await loginUseCase.invoke(
        emailaController.text, passwordController.text);
    either.fold(
      (response) {
        emit(LoginScreenSuccessState(loginResponseEntity: response));
      },
      (failure) {
        emit(LoginScreenFailureState(failure: failure));
      },
    );
  }
}
