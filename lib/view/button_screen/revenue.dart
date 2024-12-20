import 'package:flutter/material.dart';

class RevenuePage extends StatelessWidget {
  RevenuePage({super.key});

  // Sample revenue data
  final double totalEarnings = 15200.50;
  final List<Map<String, dynamic>> monthlyEarnings = [
    {'month': 'January', 'amount': 1200.00},
    {'month': 'February', 'amount': 1800.00},
    {'month': 'March', 'amount': 2400.00},
    {'month': 'April', 'amount': 2000.00},
    {'month': 'May', 'amount': 2200.00},
    {'month': 'June', 'amount': 1600.00},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Revenue Insights'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Earnings Section
            Card(
              color: Colors.amber[100],
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Earnings',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '\$${totalEarnings.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Monthly Earnings List
            const Text(
              'Monthly Earnings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: monthlyEarnings.length,
                itemBuilder: (context, index) {
                  final monthData = monthlyEarnings[index];
                  return Card(
                    child: ListTile(
                      leading: const Icon(
                        Icons.monetization_on,
                        color: Colors.green,
                      ),
                      title: Text('${monthData['month']}'),
                      trailing: Text(
                        '\$${monthData['amount'].toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
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
