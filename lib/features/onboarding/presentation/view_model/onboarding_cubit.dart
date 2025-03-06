import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/features/auth/presentation/view/login_view.dart';
import 'package:hotel_booking/features/auth/presentation/view_model/login/login_bloc.dart';

class OnboardingCubit extends Cubit<void> {
  OnboardingCubit(this._loginBloc) : super(null);

  final LoginBloc _loginBloc;

  void navigateToLogin(BuildContext context) {
    try {
      debugPrint('OnboardingCubit: Starting navigation to login...');
      
      if (!context.mounted) {
        debugPrint('OnboardingCubit: Context is no longer mounted, aborting navigation');
        return;
      }

      debugPrint('OnboardingCubit: Navigating to LoginView...');
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _loginBloc,
            child: LoginView(),
          ),
        ),
      );
      
      debugPrint('OnboardingCubit: Navigation completed successfully');
    } catch (e) {
      debugPrint('OnboardingCubit: Error during navigation: $e');
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Failed to navigate to login screen. Please try again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Retry navigation
                  navigateToLogin(context);
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
