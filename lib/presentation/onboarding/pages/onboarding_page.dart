import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/route/app_navigator.dart';
import '../../../core/route/app_route.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/font_size.dart';
import '../../../core/widgets/carousel/carousel_dual_widget.dart';
import '../../../core/widgets/richtext/richtext_widget.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          // padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          padding: EdgeInsets.fromLTRB(7.w, 20.h, 7.w, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: 5.h,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  spacing: 5.h,
                  children: [
                    _carouser(),
                  ],
                ),
              ),
              _button(context),
              RichtextWidget(
                onPressed: () {
                  AppNavigator().pushNamed(context, AppRoute.login);
                },
                title: "Already an account ? ",
                style: TextStyle(
                    fontSize: FontSize.body, fontWeight: FontWeight.w400),
                children: [
                  TextSpan(
                      text: "Log in",
                      style: TextStyle(
                          fontSize: FontSize.body, fontWeight: FontWeight.w700))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _carouser() {
    return CarouselDualWidget(
      firstHeight: 35.h,
      secondHeight: 15.h,
      spacing: 3.h,
      autoPlay: true,
      activeIndicatorColor: AppColors.orange,
      firstChildren: [
        _buildCarouselItem(),
        _buildCarouselItem(),
        _buildCarouselItem(),
      ],
      secondChildren: [
        _buildTip('Confidence in your words',
            'With conversation-based learning, you\'ll be talking from lesson one'),
        _buildTip('Take your time to learn',
            'Develop a habit of learning and make it a part of your daily routine'),
        _buildTip('The lessons you need to learn',
            'Using a variety of learning styles to learn and retain'),
      ],
    );
    // return CarouselWidget(
    //   height: 300,
    //   children: [
    //     _buildCarouselItem(),
    //     _buildCarouselItem(),
    //     _buildCarouselItem(),
    //   ],
    // );
  }

  Widget _buildCarouselItem() {
    return Column(
      spacing: 5.h,
      children: [
        SizedBox(
          width: 70.w,
          height: 70.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/icons/app_icon.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTip(String title, String subtitle) {
    return SizedBox(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: FontSize.header, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          Text(
            subtitle,
            style: TextStyle(
                fontSize: FontSize.caption, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget _button(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          {AppNavigator().pushNamed(context, AppRoute.createAnAccount)},
      child: Container(
        height: 56,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: AppColors.buttonColor),
        child: Center(
          child: Text(
            'Get Started Now',
            style: TextStyle(
              fontSize: FontSize.subtitle,
              fontWeight: FontWeight.w700,
              color: AppColors.backgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
