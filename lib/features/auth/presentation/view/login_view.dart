import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_dhukka/features/auth/presentation/view/register_view.dart';
import 'package:service_dhukka/features/auth/presentation/view_model/login/login_bloc.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Dummy data for login
  final String dummyEmail = 'ashmita@gmail.com';
  final String dummyPassword = 'password123';

  bool _isLoggedIn = false; // Track login state

  // HomeView as a widget
  Widget _buildHomeView() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.home, size: 100, color: Colors.purple),
            SizedBox(height: 20),
            Text(
              'Welcome to the Home Screen!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  // Login Form widget
  Widget _buildLoginForm() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    // App Logo and Name
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          height: 200,
                          width: 200,
                        ),
                      ],
                    ),
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Brand Bold',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      key: const ValueKey('email'),
                      controller: _emailController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      key: const ValueKey('password'),
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      }),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Handle forgot password logic
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 219, 94, 219),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // Check if email and password match the dummy data
                          if (_emailController.text == dummyEmail &&
                              _passwordController.text == dummyPassword) {
                            // Successfully logged in
                            setState(() {
                              _isLoggedIn = true;
                            });
                          } else {
                            // Show error message if credentials don't match
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Invalid credentials!')),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Brand Bold',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<LoginBloc>().add(
                                  NavigateRegisterScreenEvent(
                                    destination: RegisterView(),
                                    context: context,
                                  ),
                                );
                          },
                          child: const Text(
                            'Create Account',
                            style: TextStyle(
                              color: Color.fromARGB(255, 227, 100, 229),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('OR'),
                        ),
                        Expanded(child: Divider(color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle Facebook login
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      icon: const Icon(Icons.facebook, color: Colors.white),
                      label: const Text(
                        'Login with Facebook',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle Google login
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 222, 177, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      icon: const Icon(Icons.g_mobiledata, color: Colors.white),
                      label: const Text(
                        'Login with Google',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Display either HomeView or Login form based on _isLoggedIn state
    return _isLoggedIn ? _buildHomeView() : _buildLoginForm();
  }
}
