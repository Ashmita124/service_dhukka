import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo at the top center
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/img.jpg', 
                height: 100, 
                width: 100, 
              ),
            ),
          ),
          const Spacer(), 
          // Center text
          const Text(
            "This is my homepage",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(), // Pushes the text to the center
        ],
      ),
    );
  }
}
