import 'package:flutter/material.dart';

class BookingPage extends StatelessWidget {
  BookingPage({super.key}); // Removed 'const' because of non-constant data.

  // Sample data for bookings
  final List<Map<String, String>> upcomingBookings = [
    {
      'customerName': 'Ashmita',
      'vehicle': 'Honda Civic',
      'serviceDate': '2024-12-22',
      'status': 'Scheduled',
    },
    {
      'customerName': 'Ashmita',
      'vehicle': 'Toyota Corolla',
      'serviceDate': '2024-12-23',
      'status': 'Scheduled',
    },
    {
      'customerName': 'Ashmita',
      'vehicle': 'Honda Civic',
      'serviceDate': '2024-12-22',
      'status': 'Scheduled',
    },
    {
      'customerName': 'Ashmita',
      'vehicle': 'Toyota Corolla',
      'serviceDate': '2024-12-23',
      'status': 'Scheduled',
    },

  ];

  final int totalBookings = 120; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookings Overview'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Bookings Section
            Card(
              elevation: 3,
              child: ListTile(
                leading: const Icon(
                  Icons.book_online,
                  color: Colors.blue,
                  size: 40,
                ),
                title: Text(
                  'Total Bookings',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subtitle: Text(
                  '$totalBookings services booked',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Upcoming Bookings Section
            const Text(
              'Upcoming Bookings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: upcomingBookings.length,
                itemBuilder: (context, index) {
                  final booking = upcomingBookings[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: const Icon(
                        Icons.calendar_today,
                        color: Colors.green,
                        size: 40,
                      ),
                      title: Text(
                        booking['customerName'] ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Vehicle: ${booking['vehicle']}'),
                          Text('Service Date: ${booking['serviceDate']}'),
                        ],
                      ),
                      trailing: Text(
                        booking['status'] ?? '',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
