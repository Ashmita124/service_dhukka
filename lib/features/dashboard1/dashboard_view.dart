import 'package:flutter/material.dart';
import 'package:hotel_booking/features/dashboard1/Bottom_Screen/bookmark_view.dart';
import 'package:hotel_booking/features/dashboard1/Bottom_Screen/contact_view.dart';
import 'package:hotel_booking/features/dashboard1/Bottom_Screen/homescreen_view.dart';
import 'package:hotel_booking/features/dashboard1/Bottom_Screen/profile_view.dart';
import 'package:hotel_booking/sensor/near_detector.dart';


class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    BookmarkView(),
    const ContactView(),
    const ProfileView(),
  ];
// 
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Cycle to the next bottom navigation item.
  void _cycleBottomNav() {
    setState(() {
      _selectedIndex = (_selectedIndex + 1) % _screens.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // Wrap the whole scaffold with NearDetector.
      child: NearDetector(
        onNearDetected: _cycleBottomNav,
        child: Scaffold(
          body: _screens[_selectedIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              selectedItemColor: const Color(0xFF8E24AA),
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.white,
              elevation: 0,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.build_outlined),
                  activeIcon: Icon(Icons.build),
                  label: 'Services',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.phone_outlined),
                  activeIcon: Icon(Icons.phone),
                  label: 'Contact',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
