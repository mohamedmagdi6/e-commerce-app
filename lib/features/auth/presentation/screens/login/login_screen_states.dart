import 'package:e_commerce_app/domain/entities/login_response_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';

abstract class LoginScreenStates {}

class LoginScreenInitState extends LoginScreenStates {}

class LoginScreenLoadingState extends LoginScreenStates {}

class LoginScreenFailureState extends LoginScreenStates {
  Failures failure;
  LoginScreenFailureState({required this.failure});
}

class LoginScreenSuccessState extends LoginScreenStates {
  LoginResponseEntity loginResponseEntity;
  LoginScreenSuccessState({required this.loginResponseEntity});
}
