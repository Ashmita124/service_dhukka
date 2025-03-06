import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/features/home/presentation/view/bottom_view/sell_view.dart';
import 'package:hotel_booking/features/home/presentation/view_model/home_cubit.dart';
import 'package:hotel_booking/features/home/presentation/view_model/home_state.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'dart:async';
import 'dart:math';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  StreamSubscription? _accelerometerSubscription;
  double _lastX = 0.0, _lastY = 0.0, _lastZ = 0.0;
  final double shakeThreshold = 2.5;
  DateTime _lastShakeTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _startShakeDetection();
  }

  void _startShakeDetection() {
    _accelerometerSubscription = accelerometerEvents.listen((event) {
      final double deltaX = (event.x - _lastX).abs();
      final double deltaY = (event.y - _lastY).abs();
      final double deltaZ = (event.z - _lastZ).abs();

      if ((deltaX > shakeThreshold || deltaY > shakeThreshold || deltaZ > shakeThreshold) &&
          DateTime.now().difference(_lastShakeTime) > Duration(seconds: 1)) {
        _lastShakeTime = DateTime.now();
        _toggleBrightness();
      }

      _lastX = event.x;
      _lastY = event.y;
      _lastZ = event.z;
    });
  }

  Future<void> _toggleBrightness() async {
    double currentBrightness = await ScreenBrightness().current;
    double newBrightness = (currentBrightness > 0.5) ? 0.2 : 1.0; // Toggle between dim and bright
    await ScreenBrightness().setScreenBrightness(newBrightness);
  }

  @override
  void dispose() {
    _accelerometerSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        return state.views.elementAt(state.selectedIndex);
      }),
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(BoxIcons.bxs_home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(BoxIcons.bxs_calendar),
                label: 'Bookings',
              ),
              BottomNavigationBarItem(
                icon: SizedBox.shrink(), // Empty item for the floating button
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(BoxIcons.bxs_car),
                label: 'My Vehicles',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Account',
              ),
            ],
            backgroundColor: Colors.white,
            selectedItemColor: const Color(0xFFE31837),
            unselectedItemColor: Colors.grey,
            currentIndex: state.selectedIndex,
            onTap: (index) {
              context.read<HomeCubit>().onTabTapped(index);
            },
          );
        },
      ),
      floatingActionButton: isKeyboardVisible
          ? null // Hide FAB when the keyboard is visible
          : FloatingActionButton(
              onPressed: () {
                // Push to the SellView as a new page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SellView()),
                );
              },
              backgroundColor: const Color(0xFFE31837),
              shape: const CircleBorder(),
              child: const Icon(Icons.add, color: Colors.white),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
