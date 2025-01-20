import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:toeicsoeasy/core/contants/spacer.dart';
import '../../../common/app_navigator.dart';
import '../../../core/route/app_route.dart';
import '../../../presentation/auth/widgets/social_media_item.dart';
import '../../../presentation/auth/widgets/text_center_devider.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/font_size.dart';
import '../../../widgets/appbar/appbar_widget.dart';
import '../../../widgets/button/button_widget.dart';
import '../../../widgets/richtext/richtext_widget.dart';
import '../../../widgets/textfield/text_field_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBarWidget(
        title: 'Login',
        backgroundColor: AppColors.deepBlue,
        onBackPressed: () {
          AppNavigator().popAndPushNamed(context, AppRoute.onboarding);
        },
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppSpacer.normalPadding,
            vertical: AppSpacer.normalPadding),
        child: Column(
          spacing: 5.h,
          children: [
            _imageContainer(),
            _form(context),
          ],
        ),
      ),
    );
  }

  Widget _imageContainer() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        spacing: 20,
        children: [
          SizedBox(
            width: 100,
            child: Image.asset(
              'assets/images/icons/studying.png',
              fit: BoxFit.cover,
            ),
          ),
          Text(
            'For free, join now and start learning',
            style: TextStyle(
                fontSize: FontSize.title,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimaryColor),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget _form(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 2.h,
          children: [
            TextFieldWidget(
              title: 'Email Address',
              titleColor: AppColors.textPrimaryColor,
              placeholder: 'Your email address',
              placeholderColor: AppColors.textSecondaryColor,
              radius: 16.0,
              fillColor: AppColors.dark10,
            ),
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
            ),
            GestureDetector(
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()))
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(
                    fontSize: FontSize.caption,
                    fontWeight: FontWeight.w500,
                    color: AppColors.red),
              ),
            ),
            ButtonWidget(
              text: 'Login',
              textStyle: TextStyle(
                color: AppColors.backgroundColor,
                fontSize: FontSize.button,
                fontWeight: FontWeight.w700,
              ),
              borderRadius: 12,
              height: 56,
              textColor: AppColors.backgroundColor,
              backgroundColor: AppColors.buttonColor,
              // isLoading: false,
              onPressed: () {
                log('hehe', name: 'akr');
              },
            ),
            orDivider(),
            socialMediaBuild(),
            Center(
              child: RichtextWidget(
                onPressed: () {
                  AppNavigator().pushNamed(context, AppRoute.createAnAccount);
                },
                title: "Not you member ? ",
                style: TextStyle(
                    fontSize: FontSize.body, fontWeight: FontWeight.w400),
                children: [
                  TextSpan(
                      text: "Signup",
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
