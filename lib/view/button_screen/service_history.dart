import 'package:flutter/material.dart';

class ServiceHistoryPage extends StatelessWidget {
  ServiceHistoryPage({super.key});

  // Sample service history data
  final List<Map<String, dynamic>> serviceHistory = [
    {'date': '2024-12-15', 'service': 'Car Wash', 'amount': 20.00, 'status': 'Completed'},
    {'date': '2024-12-10', 'service': 'Oil Change', 'amount': 50.00, 'status': 'Completed'},
    {'date': '2024-11-25', 'service': 'Tire Replacement', 'amount': 150.00, 'status': 'Completed'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service History'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: serviceHistory.length,
          itemBuilder: (context, index) {
            final service = serviceHistory[index];
            return Card(
              child: ListTile(
                leading: const Icon(
                  Icons.car_repair,
                  color: Colors.blue,
                ),
                title: Text(service['service']),
                subtitle: Text('Date: ${service['date']} \nStatus: ${service['status']}'),
                trailing: Text(
                  '\$${service['amount'].toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
