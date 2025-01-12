import 'package:toeicsoeasy/configs/register_app_route.dart';
import 'package:toeicsoeasy/presentation/auth/pages/choose_a_password_page.dart';
import 'package:toeicsoeasy/presentation/auth/pages/create_an_account_page.dart';
import 'package:toeicsoeasy/presentation/auth/pages/login_page.dart';
import 'package:toeicsoeasy/presentation/onboarding/pages/onboarding_page.dart';

class AppRoute {
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String createAnAccount = '/create_an_account';
  static const String chooseAPassword = '/choose_a_password';
  
  void register() {
    RegisterRoutes.create(AppRoute.onboarding, OnboardingPage());
    RegisterRoutes.create(AppRoute.login, LoginPage());
    RegisterRoutes.create(AppRoute.createAnAccount, CreateAnAccountPage());
    RegisterRoutes.create(AppRoute.chooseAPassword, ChooseAPasswordPage());
  }
}
