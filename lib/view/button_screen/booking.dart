import 'package:flutter/material.dart';

class UserBookingPage extends StatefulWidget {
  const UserBookingPage({super.key});

  @override
  State<UserBookingPage> createState() => _UserBookingPageState();
}

class _UserBookingPageState extends State<UserBookingPage> {
  // Variables to store customer inputs
  String? _selectedService;
  String? _selectedTimeSlot;
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  // Sample services and time slots
  final List<String> _services = ['Car Wash', 'Oil Change', 'Tire Checkup', 'Brake Repair'];
  final List<String> _timeSlots = ['9:00 AM', '12:00 PM', '3:00 PM', '6:00 PM'];

  // Function to handle the booking
  void _submitBooking() {
    if (_selectedService != null && _selectedTimeSlot != null && _nameController.text.isNotEmpty && _phoneController.text.isNotEmpty) {
      // Process the booking here, for example, save to a database or send to an API.
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Booking Confirmed'),
          content: Text(
            'Thank you, ${_nameController.text}!\nYour $_selectedService has been booked for $_selectedTimeSlot. We will contact you shortly at ${_phoneController.text}.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      // Show a warning if some fields are missing
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Missing Information'),
          content: const Text('Please fill out all fields before booking.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Place Your Booking'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Customer's name
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Your Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Customer's phone number
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Dropdown to select the service
            DropdownButtonFormField<String>(
              value: _selectedService,
              hint: const Text('Select Service'),
              onChanged: (value) {
                setState(() {
                  _selectedService = value;
                });
              },
              items: _services.map((service) {
                return DropdownMenuItem<String>(
                  value: service,
                  child: Text(service),
                );
              }).toList(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Dropdown to select the time slot
            DropdownButtonFormField<String>(
              value: _selectedTimeSlot,
              hint: const Text('Select Time Slot'),
              onChanged: (value) {
                setState(() {
                  _selectedTimeSlot = value;
                });
              },
              items: _timeSlots.map((timeSlot) {
                return DropdownMenuItem<String>(
                  value: timeSlot,
                  child: Text(timeSlot),
                );
              }).toList(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),

            // Button to confirm the booking
            Center(
              child: ElevatedButton(
                onPressed: _submitBooking,
                child: const Text('Submit Booking'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
