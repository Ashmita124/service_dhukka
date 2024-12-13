
import 'package:flutter/material.dart';

import 'package:service_dhukka/view/home_screen_view.dart';
import 'package:service_dhukka/view/login_screen_view.dart';
import 'package:service_dhukka/view/onboarding_screen.dart';
import 'package:service_dhukka/view/signup_screen_view.dart';
import 'package:service_dhukka/view/splash_screen_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', // Start at the splash screen
      routes: {
        '/': (context) => const SplashScreenView(),
        // Splash screen route
        '/onboarding': (context) => const OnboardingScreen(),
        // Onboarding route
        // '/start screen': (context) => const StartScreen(),
        // Home screen route
        '/login': (context) => const LoginPage(),
        // Login page route
        '/signup': (context) => const SignUpPage(),
        // SignUp page route
        '/homepage': (context) => const HomePage(),
      },
    );
  }
}