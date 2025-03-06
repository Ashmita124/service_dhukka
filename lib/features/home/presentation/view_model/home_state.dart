import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/features/dashboard1/dashboard_view.dart';


class HomeState extends Equatable {
  final int selectedIndex;
  final List<Widget> views;

  const HomeState({
    required this.selectedIndex,
    required this.views,
  });

  // Initial state
  static HomeState initial() {
    return const HomeState(
      selectedIndex: 0,
      views: [
        Center(
          child: DashboardView(),
        ),
        Center(
          child: Text('My Bookings'),
        ),
        Center(
          child: Text('New Service'),
        ),
        Center(
          child: Text('My Vehicles'),
        ),
        Center(
          child: Text('Account'),
        ),
      ],
    );
  }

  HomeState copyWith({
    int? selectedIndex,
    List<Widget>? views,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      views: views ?? this.views,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, views];
}
