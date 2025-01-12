import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:toeicsoeasy/common/app_navigator.dart';
import 'package:toeicsoeasy/core/route/app_route.dart';
import 'package:toeicsoeasy/presentation/auth/pages/login_page.dart';
import 'package:toeicsoeasy/presentation/auth/widgets/social_media_item.dart';
import 'package:toeicsoeasy/presentation/auth/widgets/text_center_devider.dart';
import 'package:toeicsoeasy/utils/colors.dart';
import 'package:toeicsoeasy/utils/font_size.dart';
import 'package:toeicsoeasy/widgets/appbar/appbar_widget.dart';
import 'package:toeicsoeasy/widgets/button/button_widget.dart';
import 'package:toeicsoeasy/widgets/richtext/richtext_widget.dart';
import 'package:toeicsoeasy/widgets/textfield/text_field_widget.dart';

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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
        child: Column(
          spacing: 50,
          children: [
            _imageContainer(),
            _form(context),
          ],
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
            ),
            SizedBox(
              height: 20.h,
            ),
            ButtonWidget(
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
              // isLoading: false,
              onPressed: () {
                // log('hehe', name: 'akr');
              },
            ),
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
