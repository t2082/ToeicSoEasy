import 'package:flutter/material.dart';
import 'package:toeicsoeasy/presentation/auth/pages/choose_a_password_page.dart';
import 'package:toeicsoeasy/presentation/auth/pages/create_an_account_page.dart';
import 'package:toeicsoeasy/presentation/auth/pages/login_page.dart';
import 'package:toeicsoeasy/presentation/homePage/pages/home_page.dart';
import 'package:toeicsoeasy/presentation/onboarding/pages/onboarding_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Get arguments passed to the route
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/onboarding':
        return MaterialPageRoute(builder: (_) => OnboardingPage());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/create_an_account':
        return MaterialPageRoute(builder: (_) => const CreateAnAccountPage());
      case '/choose_a_password':
        return MaterialPageRoute(builder: (_) => const ChooseAPasswordPage());
      // Add more routes as needed...
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Page not found'),
        ),
      );
    });
  }
}
