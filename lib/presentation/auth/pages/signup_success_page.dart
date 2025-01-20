import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:toeicsoeasy/common/app_navigator.dart';
import 'package:toeicsoeasy/core/contants/spacer.dart';
import 'package:toeicsoeasy/core/route/app_route.dart';
import 'package:toeicsoeasy/core/utils/colors.dart';
import 'package:toeicsoeasy/core/utils/font_size.dart';
import 'package:toeicsoeasy/widgets/button/button_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpSuccessPage extends StatelessWidget {
  const SignUpSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              color: AppColors.backgroundColor,
              child: Padding(
                padding: EdgeInsets.only(
                    top: AppSpacer.largePadding,
                    left: AppSpacer.normalPadding,
                    right: AppSpacer.normalPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 3.h,
                  children: [
                    _banner(),
                    _body(),
                    _button(context),
                    _tapToOpenGmail(context),
                  ],
                ),
              ))),
    );
  }

  Widget _banner() {
    return Container(
      color: AppColors.backgroundColor,
      padding: const EdgeInsets.all(25.0),
      child: Image.asset(
        'assets/images/icons/mail.png',
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _body() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        spacing: 2.h,
        children: [
          Text(
            'Sign Up Success !',
            style: TextStyle(
              fontSize: FontSize.title,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimaryColor,
            ),
          ),
          Text(
            'Please check your email to activate your account.',
            style: TextStyle(
              fontSize: FontSize.body,
              fontWeight: FontWeight.normal,
              color: AppColors.textSecondaryColor,
            ),
          ),
        ]);
  }

  Widget _button(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: ButtonWidget(
        text: 'Go to Login',
        textStyle: TextStyle(
          color: AppColors.backgroundColor,
          fontSize: FontSize.button,
          fontWeight: FontWeight.w700,
        ),
        borderRadius: 12,
        height: 56,
        textColor: AppColors.backgroundColor,
        backgroundColor: AppColors.buttonColor,
        onPressed: () {
          AppNavigator().popAndPushNamed(context, AppRoute.login);
        },
      ),
    );
  }

  Future<void> _openGmailInbox() async {
    // Gmail inbox URL
    final Uri gmailUrl = Uri.parse('https://mail.google.com/mail/');

    try {
      if (!await launchUrl(
        gmailUrl,
        mode: LaunchMode.externalApplication,
      )) {
        throw Exception('Could not launch Gmail');
      }
    } catch (e) {
      debugPrint('Error launching Gmail: $e');
      // Handle error appropriately in your app
    }
  }

  Widget _tapToOpenGmail(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _openGmailInbox();
      },
      child: Text(
        'Tap to open Gmail',
        style: TextStyle(
          fontSize: FontSize.body,
          fontWeight: FontWeight.normal,
          color: AppColors.textSecondaryColor,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
