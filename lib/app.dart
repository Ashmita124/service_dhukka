import 'package:flutter/material.dart';
import 'package:service_dhukka/core/app_theme/app_theme.dart';
import 'package:service_dhukka/view/dashboard_view.dart';
import 'package:service_dhukka/view/login_screen_view.dart';
import 'package:service_dhukka/view/onboarding_screen.dart';
import 'package:service_dhukka/view/signup_screen_view.dart';
import 'package:service_dhukka/view/splash_screen_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      theme: getApplicationTheme(),
      routes: {
        '/': (context) => const SplashScreenView(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/dashboard': (context) => const Dashboard(),
      },
    );
  }
}