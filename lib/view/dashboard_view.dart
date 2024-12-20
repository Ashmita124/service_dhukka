import 'package:flutter/material.dart';
import 'package:service_dhukka/view/button_screen/booking.dart';
import 'package:service_dhukka/view/button_screen/notification.dart';
import 'package:service_dhukka/view/button_screen/offer.dart';
import 'package:service_dhukka/view/button_screen/profile.dart';
import 'package:service_dhukka/view/button_screen/service_history.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  final List<Widget> lstBottomScreen = [
    UserBookingPage(),
    OffersPage(),
    ServiceHistoryPage(),
    NotificationsPage(),
    CustomerProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: lstBottomScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.amber,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
           BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_rounded),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_repair),
            label: 'Service',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'My Profile',
          ),
        ],
      ),
    );
  }
}
