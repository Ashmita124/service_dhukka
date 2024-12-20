import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  OffersPage({super.key});

  // Sample offers data
  final List<Map<String, String>> offers = [
    {'title': '20% off on Car Wash', 'details': 'Valid until Dec 31, 2024'},
    {'title': 'Buy 1 Get 1 Free on Oil Change', 'details': 'Valid on weekends only'},
    {'title': 'Free Tire Checkup', 'details': 'For all bookings above \Rs.100'},
  ];

  // Image paths in your assets folder
  final List<String> imagePaths = [
    'assets/images/car.jpg',  
    'assets/images/car1.jpg',
    'assets/images/car2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offers and Discounts'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: offers.length,
          itemBuilder: (context, index) {
            final offer = offers[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image for the offer from assets
                Image.asset(
                  imagePaths[index], 
                  height: 200, 
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8),
                Card(
                  color: Colors.lightBlue[50],
                  child: ListTile(
                    leading: const Icon(
                      Icons.local_offer,
                      color: Colors.red,
                    ),
                    title: Text(offer['title']!),
                    subtitle: Text(offer['details']!),
                  ),
                ),
                SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
    );
  }
}
