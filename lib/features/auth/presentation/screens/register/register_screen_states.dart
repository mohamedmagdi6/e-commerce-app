import 'package:e_commerce_app/domain/entities/register_response_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';

abstract class RegisterScreenStates {}

class RegisterScreenInitState extends RegisterScreenStates {}

class RegisterScreenLoadingState extends RegisterScreenStates {}

class RegisterScreenSuccessState extends RegisterScreenStates {
  RegisterResponseEntity registerResponseEntity;
  RegisterScreenSuccessState({required this.registerResponseEntity});
}

class RegisterScreenFailureState extends RegisterScreenStates {
  Failures failures;
  RegisterScreenFailureState({required this.failures});
}
