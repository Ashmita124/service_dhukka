import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/features/onBoarding/presentation/view_model/onboarding_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: pageController,
                    children: [
                      buildOnboardingPage(
                        title: "Welcome to Service Dhukkai",
                        subtitle: "Your one-stop solution for all vehicle service needs",
                        icon: Icons.directions_car,
                        constraints: constraints,
                      ),
                      buildOnboardingPage(
                        title: "Professional Service",
                        subtitle: "Expert technicians and state-of-the-art facilities for your vehicle",
                        icon: Icons.build,
                        constraints: constraints,
                      ),
                      buildOnboardingPage(
                        title: "Easy Booking",
                        subtitle: "Book service appointments with just a few taps",
                        icon: Icons.calendar_today,
                        constraints: constraints,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: const SlideEffect(
                    activeDotColor: Color(0xFFE31837),
                    dotColor: Colors.black45,
                    dotHeight: 12,
                    dotWidth: 12,
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<OnboardingCubit>().navigateToLogin(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE31837),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildOnboardingPage({
    required String title,
    required String subtitle,
    required IconData icon,
    required BoxConstraints constraints,
  }) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: constraints.maxHeight * 0.45,
            child: Center(
              child: Icon(
                icon,
                size: 120,
                color: const Color(0xFFE31837),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE31837),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
