import 'package:flutter/material.dart';

class BookmarkView extends StatelessWidget {
  BookmarkView({super.key});

  final List<Map<String, dynamic>> services = [
    {
      'name': 'General Service',
      'description': 'Complete vehicle checkup and maintenance',
      'price': '₹2,499',
      'features': [
        'Oil change',
        'Filter replacement',
        'Brake check',
        'Fluid top-up',
        'Battery check',
        'AC performance'
      ],
      'icon': Icons.build_circle,
      'color': Color(0xFFE31837),
    },
    {
      'name': 'Battery Service',
      'description': 'Battery check and replacement service',
      'price': '₹1,499',
      'features': [
        'Battery health check',
        'Terminal cleaning',
        'Voltage test',
        'Alternator check',
        'Jump start',
        'Battery replacement'
      ],
      'icon': Icons.battery_charging_full,
      'color': Color(0xFF2C3E50),
    },
    {
      'name': 'AC Service',
      'description': 'Complete AC system service',
      'price': '₹1,999',
      'features': [
        'Gas refill',
        'Filter cleaning',
        'Cooling check',
        'Vent cleaning',
        'Performance test',
        'Leak detection'
      ],
      'icon': Icons.ac_unit,
      'color': Color(0xFF16A085),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE31837),
        title: const Text(
          'Available Services',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: (service['color'] as Color).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          service['icon'] as IconData,
                          color: service['color'] as Color,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              service['name'] as String,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              service['description'] as String,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: (service['color'] as Color).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          service['price'] as String,
                          style: TextStyle(
                            color: service['color'] as Color,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Service Features:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ...List.generate(
                        (service['features'] as List<String>).length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: service['color'] as Color,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                service['features'][index],
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: service['color'] as Color,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Booking ${service['name']} service...'),
                                backgroundColor: service['color'] as Color,
                              ),
                            );
                          },
                          child: const Text(
                            'Book Now',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
}
