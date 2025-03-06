import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/features/onBoarding/presentation/view/onboarding_screen_view.dart';
import 'package:hotel_booking/features/onBoarding/presentation/view_model/onboarding_cubit.dart';

class SplashCubit extends Cubit<void> {
  SplashCubit(this._onboardingCubit) : super(null);

  final OnboardingCubit _onboardingCubit;

  Future<void> init(BuildContext context) async {
    try {
      debugPrint('SplashCubit: Starting initialization...');
      
      // Simulate a 2-second delay
      await Future.delayed(const Duration(seconds: 2));
      
      if (!context.mounted) {
        debugPrint('SplashCubit: Context is no longer mounted, aborting navigation');
        return;
      }

      debugPrint('SplashCubit: Navigating to OnboardingScreen...');
      
      // Navigate to the Onboarding Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _onboardingCubit,
            child: const OnboardingScreen(),
          ),
        ),
      );
      
      debugPrint('SplashCubit: Navigation completed successfully');
    } catch (e) {
      debugPrint('SplashCubit: Error during initialization: $e');
      if (context.mounted) {
        // Show error dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Failed to initialize the app. Please try again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Retry initialization
                  init(context);
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        );
      }
    }
  }
}
