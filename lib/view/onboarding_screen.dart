import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/images/car.jpg",
      "title": "Effortless Car Care",
      "description": "Your one-stop solution for vehicle maintenance, delivered with ease and efficiency."
    },
    {
      "image": "assets/images/car1.jpg",
      "title": "Drive Worry-Free",
      "description": "Reliable vehicle servicing to keep you moving without a hitch."
    },
    {
      "image": "assets/images/car2.jpg",
      "title": "Smart Auto Solutions",
      "description": "Experience seamless car care with advanced, tech-driven services."
    },
  ];

  void _goToLogin() {
    Navigator.pushReplacementNamed(context, '/login'); // Navigate to the login page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fullscreen Image (Background)
          PageView.builder(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: _onboardingData.length,
            itemBuilder: (context, index) {
              return Image.asset(
                _onboardingData[index]["image"]!,
                fit: BoxFit.contain, // Ensures the image fits the screen without zooming or cropping
                width: double.infinity,
                height: double.infinity,
              );
            },
          ),

          // Content Overlay
          Column(
            children: [
              // Top Section: Skip Button
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 50), // Placeholder to balance alignment
                    TextButton(
                      onPressed: _goToLogin, // Navigate to the login page when Skip is pressed
                      child: const Text(
                        "Skip",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),

              // Title and Description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  children: [
                    Text(
                      _onboardingData[_currentIndex]["title"]!,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _onboardingData[_currentIndex]["description"]!,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const Spacer(),

              // Bottom Section: Dots and Next Button
              Padding(
                padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(
                        _onboardingData.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _currentIndex == index
                                ? const Color.fromARGB(255, 46, 91, 240)
                                : const Color.fromARGB(255, 90, 85, 237),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (_currentIndex == _onboardingData.length - 1) {
                          _goToLogin(); // On the last page, navigate to login
                        } else {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Text(
                        _currentIndex == _onboardingData.length - 1
                            ? "Get Started" // When on the last page, show "Get Started"
                            : "Next", // Otherwise show "Next"
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
