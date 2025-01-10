import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:toeicsoeasy/presentation/auth/pages/choose_a_password_page.dart';
import 'package:toeicsoeasy/presentation/auth/pages/login_page.dart';
import 'package:toeicsoeasy/utils/colors.dart';
import 'package:toeicsoeasy/utils/font_size.dart';
import 'package:toeicsoeasy/widgets/button/button_widget.dart';
import 'package:toeicsoeasy/widgets/common/text/paragraph_1.dart';
import 'package:toeicsoeasy/widgets/textfield/text_field_widget.dart';

class CreateAnAccountPage extends StatelessWidget {
  const CreateAnAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(color: AppColors.backgroundColor),
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
      child: Column(
        spacing: 50,
        children: [
          _imageContainer(),
          _form(context),
        ],
      ),
    );
  }

  Widget _imageContainer() {
    return Center(
      child: Text(
        'Create an Account',
        style: TextStyle(
            fontSize: FontSize.subtitle,
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
              title: 'First Name',
              titleColor: AppColors.textPrimaryColor,
              placeholder: 'Your first name',
              placeholderColor: AppColors.textSecondaryColor,
              radius: 16.0,
              fillColor: AppColors.dark05,
            ),
            TextFieldWidget(
              title: 'Last Name',
              titleColor: AppColors.textPrimaryColor,
              placeholder: 'Your last name',
              placeholderColor: AppColors.textSecondaryColor,
              radius: 16.0,
              fillColor: AppColors.dark05,
            ),
            TextFieldWidget(
              title: 'Email Address',
              titleColor: AppColors.textPrimaryColor,
              placeholder: 'Your email address',
              placeholderColor: AppColors.textSecondaryColor,
              radius: 16.0,
              fillColor: AppColors.dark05,
            ),
            SizedBox(
              height: 2.w,
            ),
            ButtonWidget(
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
              // isLoading: false,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChooseAPasswordPage()));
              },
            ),
            _socialMediaBuild(context)
          ],
        )
      ],
    );
  }

  Widget _socialMediaBuild(BuildContext context) {
    return Column(
      children: [
        _orDivider(context),
        Row(
          spacing: 5.w,
          children: [
            Expanded(
                child: _socialMediaItem(Icon(
              Icons.facebook,
              color: AppColors.buttonColor,
              size: 30,
            ))),
            Expanded(
                child: _socialMediaItem(Icon(
              Icons.g_mobiledata_outlined,
              color: AppColors.buttonColor,
              size: 30,
            ))),
          ],
        ),
        paragraph_1(
          'Are you member?',
          TextStyle(fontSize: FontSize.caption, fontWeight: FontWeight.w400),
          'Login',
          TextStyle(
              fontSize: FontSize.caption,
              fontWeight: FontWeight.w700,
              color: AppColors.blue),
          context,
          () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
        )
      ],
    );
  }

  Widget _orDivider(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 1,
            endIndent: 10,
            indent: 10,
            height: 20,
          ),
        ),
        Text(
          'Or',
          style: TextStyle(
            color: AppColors.textPrimaryColor,
            fontSize: 16,
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 1,
            endIndent: 10,
            indent: 10,
            height: 20,
          ),
        )
      ],
    );
  }

  Widget _socialMediaItem(Icon icon) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.dark05,
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      child: Center(child: icon),
    );
  }
}
