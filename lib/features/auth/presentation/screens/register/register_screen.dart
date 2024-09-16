import 'package:e_commerce_app/di/di.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/register/register_screen_states.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/register/register_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/widget/custom_elevated_button.dart';
import '../../../../../core/widget/main_text_field.dart';
import '../../../../../core/widget/validators.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreenViewModel registerScreenViewModel =
      getIt<RegisterScreenViewModel>(); // field ijection.
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterScreenViewModel, RegisterScreenStates>(
      bloc: registerScreenViewModel,
      listener: (context, state) {
        if (state is RegisterScreenLoadingState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('loading ..')));
        } else if (state is RegisterScreenFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.failures.errorMessage)));
        } else if (state is RegisterScreenSuccessState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('success')));
        }
      },
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppSize.s40.h,
                  ),
                  Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                  SizedBox(
                    height: AppSize.s40.h,
                  ),
                  BuildTextField(
                    backgroundColor: ColorManager.white,
                    hint: 'enter your full name',
                    label: 'Full Name',
                    textInputType: TextInputType.name,
                    validation: AppValidators.validateFullName,
                    controller: registerScreenViewModel.nameController,
                  ),
                  SizedBox(
                    height: AppSize.s18.h,
                  ),
                  BuildTextField(
                    hint: 'enter your mobile no.',
                    backgroundColor: ColorManager.white,
                    label: 'Mobile Number',
                    validation: AppValidators.validatePhoneNumber,
                    textInputType: TextInputType.phone,
                    controller: registerScreenViewModel.phoneController,
                  ),
                  SizedBox(
                    height: AppSize.s18.h,
                  ),
                  BuildTextField(
                    hint: 'enter your email address',
                    backgroundColor: ColorManager.white,
                    label: 'E-mail address',
                    validation: AppValidators.validateEmail,
                    textInputType: TextInputType.emailAddress,
                    controller: registerScreenViewModel.emailController,
                  ),
                  SizedBox(
                    height: AppSize.s18.h,
                  ),
                  BuildTextField(
                    hint: 'enter your password',
                    backgroundColor: ColorManager.white,
                    label: 'password',
                    validation: AppValidators.validatePassword,
                    isObscured: true,
                    textInputType: TextInputType.text,
                    controller: registerScreenViewModel.passwordController,
                  ),
                  SizedBox(
                    height: AppSize.s18.h,
                  ),
                  BuildTextField(
                    hint: 'enter your rePassword',
                    backgroundColor: ColorManager.white,
                    label: 'rePassword',
                    validation: AppValidators.validatePassword,
                    isObscured: true,
                    textInputType: TextInputType.text,
                    controller: registerScreenViewModel.rePasswordController,
                  ),
                  SizedBox(
                    height: AppSize.s50.h,
                  ),
                  Center(
                    child: SizedBox(
                      height: AppSize.s60.h,
                      width: MediaQuery.of(context).size.width * .9,
                      child: CustomElevatedButton(
                        // borderRadius: AppSize.s8,
                        label: 'Sign Up',
                        backgroundColor: ColorManager.white,
                        textStyle: getBoldStyle(
                            color: ColorManager.primary, fontSize: AppSize.s20),
                        onTap: () {
                          registerScreenViewModel.register();
                          // Navigator.pushNamed(context, Routes.mainRoute);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
