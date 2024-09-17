import 'package:e_commerce_app/di/di.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/login/login_screen_states.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/login/login_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/routes_manager/routes.dart';
import '../../../../../core/widget/custom_elevated_button.dart';
import '../../../../../core/widget/main_text_field.dart';
import '../../../../../core/widget/validators.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  LoginScreenViewModel loginScreenViewModel = getIt<LoginScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginScreenViewModel, LoginScreenStates>(
      bloc: loginScreenViewModel,
      listener: (context, state) {
        if (state is LoginScreenLoadingState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('loading ..')));
        } else if (state is LoginScreenFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.failure.errorMessage)));
        } else if (state is LoginScreenSuccessState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('success')));
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.mainRoute, (route) => false);
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
                  Text(
                    'Welcome Back To Route',
                    style: getBoldStyle(color: ColorManager.white)
                        .copyWith(fontSize: FontSize.s24.sp),
                  ),
                  Text(
                    'Please sign in with your mail',
                    style: getLightStyle(color: ColorManager.white)
                        .copyWith(fontSize: FontSize.s16.sp),
                  ),
                  SizedBox(
                    height: AppSize.s50.h,
                  ),
                  BuildTextField(
                    backgroundColor: ColorManager.white,
                    hint: 'enter your name',
                    label: 'User name',
                    textInputType: TextInputType.emailAddress,
                    validation: AppValidators.validateEmail,
                    controller: loginScreenViewModel.emailaController,
                  ),
                  SizedBox(
                    height: AppSize.s28.h,
                  ),
                  BuildTextField(
                    hint: 'enter your password',
                    backgroundColor: ColorManager.white,
                    label: 'Password',
                    validation: AppValidators.validatePassword,
                    isObscured: true,
                    textInputType: TextInputType.text,
                    controller: loginScreenViewModel.passwordController,
                  ),
                  SizedBox(
                    height: AppSize.s8.h,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forget password?',
                            style: getMediumStyle(color: ColorManager.white)
                                .copyWith(fontSize: FontSize.s18.sp),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: AppSize.s60.h,
                  ),
                  Center(
                    child: SizedBox(
                      // width: MediaQuery.of(context).size.width * .8,
                      child: CustomElevatedButton(
                        // borderRadius: AppSize.s8,
                        isStadiumBorder: false,
                        label: 'Login',
                        backgroundColor: ColorManager.white,
                        textStyle: getBoldStyle(
                            color: ColorManager.primary, fontSize: AppSize.s18),
                        onTap: () {
                          loginScreenViewModel.logIn();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account?',
                        style: getSemiBoldStyle(color: ColorManager.white)
                            .copyWith(fontSize: FontSize.s16.sp),
                      ),
                      SizedBox(
                        width: AppSize.s8.w,
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, Routes.signUpRoute),
                        child: Text(
                          'Create Account',
                          style: getSemiBoldStyle(color: ColorManager.white)
                              .copyWith(fontSize: FontSize.s16.sp),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
