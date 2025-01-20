

import 'package:toeicsoeasy/presentation/auth/pages/signup_success_page.dart';

import '../../configs/register_app_route.dart';
import '../../presentation/auth/pages/choose_a_password_page.dart';
import '../../presentation/auth/pages/create_an_account_page.dart';
import '../../presentation/auth/pages/login_page.dart';
import '../../presentation/onboarding/pages/onboarding_page.dart';

class AppRoute {
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String createAnAccount = '/create_an_account';
  static const String chooseAPassword = '/choose_a_password';
  static const String signupSuccess = '/signup_success';
  
  void register() {
    RegisterRoutes.create(AppRoute.onboarding, OnboardingPage());
    RegisterRoutes.create(AppRoute.login, LoginPage());
    RegisterRoutes.create(AppRoute.createAnAccount, CreateAnAccountPage());
    RegisterRoutes.create(AppRoute.chooseAPassword, ChooseAPasswordPage());
    RegisterRoutes.create(AppRoute.signupSuccess, SignUpSuccessPage());
  }
}
