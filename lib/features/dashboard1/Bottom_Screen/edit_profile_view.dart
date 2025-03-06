// edit_profile_view.dart
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:hotel_booking/features/auth/data/data_source/remote_datasource/user_profile_service.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final UserProfileService profileService = UserProfileService(Dio());
  bool isLoading = false;
  String? errorMessage;
// 
  @override
  void initState() {
    super.initState();
    // Initialize with dummy data
    nameController.text = "John Doe";
    emailController.text = "john.doe@example.com";
    phoneController.text = "+1 234 567 890";
    addressController.text = "123 Service Street, City";
    loadUserProfile();
  }

  Future<void> loadUserProfile() async {
    try {
      final user = await profileService.fetchUserProfile();
      setState(() {
        nameController.text = user.username;
        emailController.text = user.email;
        phoneController.text = user.phone;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  Future<void> updateProfile() async {
    setState(() {
      isLoading = true;
    });
    try {
      final updatedUser = await profileService.updateUserProfile(
        username: nameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
      );
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile updated successfully")),
      );
      // Return updated user info to refresh the profile view if needed
      Navigator.pop(context, updatedUser);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error updating profile: $e")),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (errorMessage != null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Edit Profile")),
        body: Center(child: Text("Error: $errorMessage")),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8E24AA),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFF8E24AA),
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  prefixIcon: const Icon(Icons.person, color: Color(0xFF8E24AA)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) => value?.isEmpty ?? true ? 'Please enter your name' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email, color: Color(0xFF8E24AA)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) => value?.isEmpty ?? true ? 'Please enter your email' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: const Icon(Icons.phone, color: Color(0xFF8E24AA)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) => value?.isEmpty ?? true ? 'Please enter your phone number' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  prefixIcon: const Icon(Icons.location_on, color: Color(0xFF8E24AA)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) => value?.isEmpty ?? true ? 'Please enter your address' : null,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8E24AA),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      updateProfile();
                    }
                  },
                  child: const Text(
                    'Save Changes',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
