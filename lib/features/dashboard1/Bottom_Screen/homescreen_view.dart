import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/app/di/di.dart';
import 'package:hotel_booking/features/auth/presentation/view/login_view.dart';
import 'package:hotel_booking/features/dashboard1/Bottom_Screen/bookmark_view.dart';
import 'package:hotel_booking/features/dashboard1/admin_screens/view_model/hotel_bloc.dart';
import 'package:hotel_booking/features/dashboard1/admin_screens/view_model/hotel_event.dart';
import 'package:hotel_booking/features/dashboard1/admin_screens/view_model/hotel_state.dart';

import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StreamSubscription<AccelerometerEvent> _accelerometerSubscription;
  final double _shakeThreshold = 15.0; // Adjust threshold as needed
  DateTime _lastShakeTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    _accelerometerSubscription = accelerometerEvents.listen((event) {
      // Calculate the total acceleration
      final double acceleration =
          sqrt(event.x * event.x + event.y * event.y + event.z * event.z);
      if (acceleration > _shakeThreshold) {
        final now = DateTime.now();
        // Prevent multiple triggers (2 second cooldown)
        if (now.difference(_lastShakeTime) > const Duration(seconds: 2)) {
          _lastShakeTime = now;
          _confirmLogout();
        }
      }
    });
  }

  Future<void> _confirmLogout() async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Yes', style: TextStyle(color: Color(0xFF8E24AA))),
          ),
        ],
      ),
    );

    if (shouldLogout == true) {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginView()),
      );
    }
  }

  @override
  void dispose() {
    _accelerometerSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF8E24AA),
        elevation: 0,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.directions_car,
                size: 24,
                color: Color(0xFF8E24AA),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Service Dhukkai',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: _confirmLogout,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            _buildOfferBanner(context),
            _buildSectionTitle('Popular Services', context),
            _buildPopularServices(),
            _buildSectionTitle('Recommended Services', context),
            _buildRecommendedServices(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search, color: Color(0xFF8E24AA)),
            hintText: 'Search Vehicle Services',
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOfferBanner(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF8E24AA), Color(0xFFE91E63)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Special Offer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '20% off on first service',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF8E24AA),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => BookmarkView()),
                    );
                  },
                  child: const Text('Book Now >'),
                ),
              ],
            ),
            const Icon(
              Icons.directions_car,
              size: 80,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => BookmarkView()),
              );
            },
            child: const Text(
              'See All >',
              style: TextStyle(color: Color(0xFF8E24AA)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularServices() {
    final services = [
      {'icon': Icons.build, 'name': 'General Service', 'price': 'Rs. 2,499'},
      {'icon': Icons.battery_charging_full, 'name': 'Battery Service', 'price': 'Rs. 1,499'},
      {'icon': Icons.tire_repair, 'name': 'Tire Service', 'price': 'Rs. 999'},
      {'icon': Icons.cleaning_services, 'name': 'Car Wash', 'price': 'Rs. 499'},
    ];

    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: services.map((service) {
          return Container(
            width: 160,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFF8E24AA).withOpacity(0.1),
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  ),
                  child: Center(
                    child: Icon(
                      service['icon'] as IconData,
                      size: 40,
                      color: const Color(0xFF8E24AA),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        service['name'] as String,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        service['price'] as String,
                        style: const TextStyle(
                          color: Color(0xFF8E24AA),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildRecommendedServices() {
    final services = [
      {'icon': Icons.airline_seat_recline_normal, 'name': 'AC Service', 'price': 'Rs. 1,999'},
      {'icon': Icons.engineering, 'name': 'Engine Tune-up', 'price': 'Rs. 3,499'},
      {'icon': Icons.format_paint, 'name': 'Paint Service', 'price': 'Rs. 4,999'},
      {'icon': Icons.electric_bolt, 'name': 'Electrical Service', 'price': 'Rs. 2,999'},
    ];

    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: services.map((service) {
          return Container(
            width: 160,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFF8E24AA).withOpacity(0.1),
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  ),
                  child: Center(
                    child: Icon(
                      service['icon'] as IconData,
                      size: 40,
                      color: const Color(0xFF8E24AA),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        service['name'] as String,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        service['price'] as String,
                        style: const TextStyle(
                          color: Color(0xFF8E24AA),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
