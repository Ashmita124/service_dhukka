import 'package:flutter/material.dart';

class UserBookingPage extends StatelessWidget {
  const UserBookingPage({super.key});
// 
  @override
  Widget build(BuildContext context) {
    // Dummy booking data
    final List<Map<String, dynamic>> bookings = [
      {
        'serviceName': 'General Service',
        'vehicleName': 'Toyota Camry 2020',
        'date': '2024-03-25',
        'time': '10:00 AM',
        'status': 'Confirmed',
        'price': 'Rs. 2,499',
        'icon': Icons.build,
      },
      {
        'serviceName': 'AC Service',
        'vehicleName': 'Honda CBR 250R',
        'date': '2024-03-28',
        'time': '2:30 PM',
        'status': 'Pending',
        'price': 'Rs. 1,999',
        'icon': Icons.ac_unit,
      },
      {
        'serviceName': 'Battery Service',
        'vehicleName': 'Toyota Camry 2020',
        'date': '2024-03-20',
        'time': '11:30 AM',
        'status': 'Completed',
        'price': 'Rs. 1,499',
        'icon': Icons.battery_charging_full,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8E24AA),
        title: const Text(
          'My Bookings',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF8E24AA).withOpacity(0.1),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF8E24AA).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          booking['icon'] as IconData,
                          color: const Color(0xFF8E24AA),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              booking['serviceName'] as String,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              booking['vehicleName'] as String,
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: _getStatusColor(booking['status'] as String),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          booking['status'] as String,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.calendar_today,
                                  size: 16, color: Color(0xFF8E24AA)),
                              const SizedBox(width: 8),
                              Text(booking['date'] as String),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.access_time,
                                  size: 16, color: Color(0xFF8E24AA)),
                              const SizedBox(width: 8),
                              Text(booking['time'] as String),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        booking['price'] as String,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF8E24AA),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'completed':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
