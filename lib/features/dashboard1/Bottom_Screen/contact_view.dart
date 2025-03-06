import 'package:flutter/material.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  _ContactViewState createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  void _clearFields() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    messageController.clear();
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Thank You!'),
        content: const Text('We have received your message and will get back to you soon.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK', style: TextStyle(color: Color(0xFF8E24AA))),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8E24AA),
        elevation: 0,
        title: const Text(
          'Contact Us',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: const TextStyle(color: Color(0xFF8E24AA)),
                        prefixIcon: const Icon(Icons.person, color: Color(0xFF8E24AA)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFF8E24AA)),
                        ),
                      ),
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'Please enter your name' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: const TextStyle(color: Color(0xFF8E24AA)),
                        prefixIcon: const Icon(Icons.email, color: Color(0xFF8E24AA)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFF8E24AA)),
                        ),
                      ),
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'Please enter your email' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        labelText: 'Phone',
                        labelStyle: const TextStyle(color: Color(0xFF8E24AA)),
                        prefixIcon: const Icon(Icons.phone, color: Color(0xFF8E24AA)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFF8E24AA)),
                        ),
                      ),
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'Please enter your phone' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: messageController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: 'Message',
                        labelStyle: const TextStyle(color: Color(0xFF8E24AA)),
                        prefixIcon: const Icon(Icons.message, color: Color(0xFF8E24AA)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFF8E24AA)),
                        ),
                      ),
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'Please enter your message' : null,
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF8E24AA), Color(0xFFE91E63)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            _showSuccessDialog();
                            _clearFields();
                          }
                        },
                        child: const Text(
                          'Send Message',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF8E24AA).withOpacity(0.1),
                        const Color(0xFFE91E63).withOpacity(0.1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Service Dhukkai',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF8E24AA),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Your trusted vehicle service partner',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFE91E63),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Color(0xFF8E24AA)),
                          const SizedBox(width: 8),
                          Text(
                            '123 Service Street, City, Country',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.phone, color: Color(0xFF8E24AA)),
                          const SizedBox(width: 8),
                          Text(
                            '+1 234 567 890',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.email, color: Color(0xFF8E24AA)),
                          const SizedBox(width: 8),
                          Text(
                            'contact@servicedhukkai.com',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
