import 'package:e_commerce_app/domain/use_cases/register_use_case.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/register/register_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterScreenViewModel extends Cubit<RegisterScreenStates> {
  RegisterUseCase registerUseCase;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  RegisterScreenViewModel({required this.registerUseCase})
      : super(RegisterScreenInitState());
  void register() async {
    emit(RegisterScreenLoadingState());
    var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        phoneController.text,
        passwordController.text,
        rePasswordController.text);
    either.fold((response) {
      emit(RegisterScreenSuccessState(registerResponseEntity: response));
    }, (failure) {
      emit(RegisterScreenFailureState(failures: failure));
    });
  }
}
