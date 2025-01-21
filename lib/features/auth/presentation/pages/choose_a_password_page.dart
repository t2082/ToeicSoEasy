import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:toeicsoeasy/common/bloc/button/button_state.dart';
import 'package:toeicsoeasy/common/bloc/button/button_state_cubit.dart';
import 'package:toeicsoeasy/core/contants/spacer.dart';
import 'package:toeicsoeasy/core/service_locator.dart';
import 'package:toeicsoeasy/features/auth/data/models/signup_user_req_params.dart';
import 'package:toeicsoeasy/features/auth/domain/usecases/signup_usecase.dart';
import 'package:toeicsoeasy/core/widgets/snackbar/snackbar_widget.dart';
import 'package:toeicsoeasy/features/auth/presentation/bloc/auth_bloc.dart';
import '../../../../core/route/app_navigator.dart';
import '../../../../core/route/app_route.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/font_size.dart';
import '../../../../core/widgets/appbar/appbar_widget.dart';
import '../../../../core/widgets/button/button_widget.dart';
import '../../../../core/widgets/richtext/richtext_widget.dart';
import '../../../../core/widgets/textfield/text_field_widget.dart';
import '../widgets/social_media_item.dart';
import '../widgets/text_center_devider.dart';

class ChooseAPasswordPage extends StatelessWidget {
  const ChooseAPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar:
          AppBarWidget(title: 'Register', backgroundColor: AppColors.deepBlue),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonStateCubit(),
      child: BlocListener<ButtonStateCubit, ButtonState>(
        listener: (context, state) {
          if (state is ButtonSuccessState) {
            AppNavigator().pushNamed(context, AppRoute.signupSuccess);
            SnackBarWidget.show(
                context: context,
                title: 'Success',
                message: 'Your account has been created successfully !',
                type: SnackBarType.success);
          } else if (state is ButtonErrorState) {
            SnackBarWidget.show(
                context: context,
                title: 'Error',
                message: state.message,
                type: SnackBarType.failed);
          }
          // else {
          //   SnackBarWidget.show(
          //       context: context,
          //       title: 'Error',
          //       message:
          //           'Something when wrong and this action could not be completed !',
          //       type: SnackBarType.failed);
          // }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppSpacer.normalPadding,
                vertical: AppSpacer.normalPadding),
            child: Column(
              spacing: 50,
              children: [
                _imageContainer(),
                _form(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _imageContainer() {
    return Center(
      child: Text(
        'Choose a Password',
        style: TextStyle(
            fontSize: FontSize.title,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimaryColor),
      ),
    );
  }

  Widget _form(BuildContext context) {
    final _passwordController = TextEditingController();
    final _retypePasswordController = TextEditingController();
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 2.h,
          children: [
            TextFieldWidget(
              title: 'Password',
              titleColor: AppColors.textPrimaryColor,
              placeholder: '••••••••••',
              placeholderColor: AppColors.textSecondaryColor,
              radius: 16.0,
              fillColor: AppColors.dark10,
              obscureText: true,
              suffixIcon: Icon(Icons.remove_red_eye_outlined),
              suffixIconColor: AppColors.grayDark50,
              controller: _passwordController,
            ),
            TextFieldWidget(
              title: 'Confirm Password',
              titleColor: AppColors.textPrimaryColor,
              placeholder: '••••••••••',
              placeholderColor: AppColors.textSecondaryColor,
              radius: 16.0,
              fillColor: AppColors.dark10,
              obscureText: true,
              suffixIcon: Icon(Icons.remove_red_eye_outlined),
              suffixIconColor: AppColors.grayDark50,
              controller: _retypePasswordController,
            ),
            SizedBox(
              height: 20.h,
            ),
            BlocBuilder<ButtonStateCubit, ButtonState>(
                builder: (context, state) {
              return ButtonWidget(
                text: 'Create Account',
                textStyle: TextStyle(
                  color: AppColors.backgroundColor,
                  fontSize: FontSize.button,
                  fontWeight: FontWeight.w700,
                ),
                borderRadius: 12,
                height: 56,
                textColor: AppColors.backgroundColor,
                backgroundColor: AppColors.buttonColor,
                isLoading: state is ButtonLoadingState,
                onPressed: () {
                  final password = _passwordController.text.trim();
                  final repassword = _retypePasswordController.text.trim();
                  final state = context.read<AuthBloc>().state;

                  // log(state.firstName.toString());
                  if (password == repassword) {
                    context.read<ButtonStateCubit>().excute(
                          SignupReqParams(
                              email: _passwordController.text,
                              password: _passwordController.text),
                          servicelocator<SignupUseCase>(),
                        );
                  } else {
                    SnackBarWidget.show(
                        context: context,
                        title: 'Error',
                        message: 'Password not match !',
                        type: SnackBarType.failed);
                  }

                  // Thiếu Bloc Provicer
                },
              );
            }),
            orDivider(),
            socialMediaBuild(),
            Center(
              child: RichtextWidget(
                onPressed: () {
                  AppNavigator().popAndPushNamed(context, AppRoute.login);
                },
                title: "Are you member ? ",
                style: TextStyle(
                    fontSize: FontSize.body, fontWeight: FontWeight.w400),
                children: [
                  TextSpan(
                      text: "Login",
                      style: TextStyle(
                          fontSize: FontSize.body,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blue))
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
