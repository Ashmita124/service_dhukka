import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Set the background color to white
        child: SingleChildScrollView( // Make the content scrollable
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50), // Add spacing for better alignment
                // Logo
                Center(
                  child: Image.asset(
                    'assets/logo/logo.png',
                    height: 150,
                  ),
                ),
                const SizedBox(height: 20),
                // Heading Text
                const Text(
                  "Welcome Back!",
                ),
                const SizedBox(height: 20),
                // Email Field
                const TextField(
                  decoration: InputDecoration(
                    labelText: "E-MAIL",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                // Password Field
                const TextField(
                  decoration: InputDecoration(
                    labelText: "PASSWORD",
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                // Login Button
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the HomeScreen after login
                    Navigator.pushReplacementNamed(context, '/dashboard');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Log In",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    // Add forgot password functionality
                  },
                  child: const Text("Forgot Password?"),
                ),
                const SizedBox(height: 20),
                // Sign Up Navigation
                Column(
                  children: [
                    const Text("Don’t have an account?"),
                    TextButton(
                      onPressed: () {
                        // Navigate to SignUpPage
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: const Text("Create Account"),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Social Login Icons (Facebook, Google)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        // Add Facebook login functionality
                      },
                      icon: const Icon(Icons.facebook),
                      iconSize: 40, // Set icon size
                      color: Colors.blue, // Set Facebook icon color
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      onPressed: () {
                        // Add Google login functionality
                      },
                      icon: const Icon(Icons.g_mobiledata),
                      iconSize: 40, // Set icon size
                      color: Color.fromARGB(255, 0, 0, 0), // Google red color // Set Google icon color
                    ),
                    const SizedBox(width: 10),

                  ],
                ),
                const SizedBox(height: 250), // Add spacing at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}
