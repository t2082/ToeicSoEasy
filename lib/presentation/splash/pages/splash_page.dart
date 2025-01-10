import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toeicsoeasy/presentation/onboarding/pages/onboarding_page.dart';
import 'package:toeicsoeasy/presentation/splash/bloc/splash_cubit.dart';
import 'package:toeicsoeasy/presentation/splash/bloc/splash_state.dart';
import 'package:toeicsoeasy/services/navigator/navigation_service.dart';
import 'package:toeicsoeasy/utils/colors.dart';
import 'package:toeicsoeasy/utils/font_size.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});
  final NavigationService _navigationService = NavigationService();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          _navigationService.pushReplacementNamed('/onboarding');
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.deepBlue,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/icons/app_icon.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                'Toeic So Easy',
                style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: FontSize.largeText,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 200,
                child: LinearProgressIndicator(
                    // value: 0.2,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
