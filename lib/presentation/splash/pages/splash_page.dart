import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/route/app_route.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/font_size.dart';
import '../bloc/splash_cubit.dart';
import '../bloc/splash_state.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          Navigator.pushReplacementNamed(context, AppRoute.onboarding);
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
