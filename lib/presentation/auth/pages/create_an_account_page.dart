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

class CreateAnAccountPage extends StatelessWidget {
  const CreateAnAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBarWidget(
        title: 'Register',
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
        'Create an Account',
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
          spacing: 3.h,
          children: [
            TextFieldWidget(
              title: 'First Name',
              titleColor: AppColors.textPrimaryColor,
              placeholder: 'Your first name',
              placeholderColor: AppColors.textSecondaryColor,
              radius: 16.0,
              fillColor: AppColors.dark10,
            ),
            TextFieldWidget(
              title: 'Last Name',
              titleColor: AppColors.textPrimaryColor,
              placeholder: 'Your last name',
              placeholderColor: AppColors.textSecondaryColor,
              radius: 16.0,
              fillColor: AppColors.dark10,
            ),
            TextFieldWidget(
              title: 'Email Address',
              titleColor: AppColors.textPrimaryColor,
              placeholder: 'example@domain.com',
              placeholderColor: AppColors.textSecondaryColor,
              radius: 16.0,
              fillColor: AppColors.dark10,
            ),
            Padding(
              padding: EdgeInsets.only(top: 3.h),
              child: ButtonWidget(
                text: 'Continue',
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
                  AppNavigator().pushNamed(context, AppRoute.chooseAPassword);
                },
              ),
            ),
            orDivider(),
            socialMediaBuild(),
            Center(
              child: RichtextWidget(
                onPressed: () {
                  AppNavigator().pushNamed(context, AppRoute.login);
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
