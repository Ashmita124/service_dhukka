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

  void _goToHome() {
    Navigator.pushReplacementNamed(context, '/login'); // Navigate to the home page
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
                fit: BoxFit.contain, // Ensures the image fits the screen without cropping
                width: double.infinity,
                height: double.infinity,
              );
            },
          ),

          // Content Overlay
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top Bar (Skip Button)
              Padding(
                padding: const EdgeInsets.only(top: 50, right: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: _goToHome,
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),

              // Centered Content (Text)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _onboardingData[_currentIndex]["title"]!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Black title text
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _onboardingData[_currentIndex]["description"]!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black, // Black description text
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              // Bottom Bar (Dots and Next Button)
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
                          _goToHome(); // On the last page, navigate to home
                        } else {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Text(
                        _currentIndex == _onboardingData.length - 1
                            ? "Get Started"
                            : "Next",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black, // Black "Get Started" text
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
