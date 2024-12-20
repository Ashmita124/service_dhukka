import 'package:flutter/material.dart';

class VehicleDetailsPage extends StatelessWidget {
  VehicleDetailsPage({super.key});

  // Sample data for vehicles
  final List<Map<String, String>> vehicleData = [
    {'type': 'Car', 'brand': 'Toyota', 'model': 'Corolla'},
    {'type': 'Bike', 'brand': 'Yamaha', 'model': 'R15'},
    {'type': 'Car', 'brand': 'Honda', 'model': 'Civic'},
    {'type': 'Truck', 'brand': 'Tata', 'model': 'Prima'},
    {'type': 'Car', 'brand': 'Hyundai', 'model': 'Creta'},
    {'type': 'Bike', 'brand': 'Suzuki', 'model': 'Gixxer'},
  ];

  // Sample insights
  final Map<String, int> vehicleInsights = {
    'Total Vehicles': 6,
    'Cars': 3,
    'Bikes': 2,
    'Trucks': 1,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicle Details & Insights'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Insights Section
            const Text(
              'Vehicle Insights',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text('Total Vehicles: ${vehicleInsights['Total Vehicles']}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Cars: ${vehicleInsights['Cars']}'),
                    Text('Bikes: ${vehicleInsights['Bikes']}'),
                    Text('Trucks: ${vehicleInsights['Trucks']}'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Vehicle Details Section
            const Text(
              'Vehicle Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: vehicleData.length,
                itemBuilder: (context, index) {
                  final vehicle = vehicleData[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(
                        vehicle['type'] == 'Car'
                            ? Icons.directions_car
                            : vehicle['type'] == 'Bike'
                                ? Icons.motorcycle
                                : Icons.local_shipping,
                        color: Colors.blue,
                        size: 40,
                      ),
                      title: Text('${vehicle['brand']} ${vehicle['model']}'),
                      subtitle: Text('Type: ${vehicle['type']}'),
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
