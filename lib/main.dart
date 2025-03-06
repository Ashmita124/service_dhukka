import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:hotel_booking/app/app.dart';
import 'package:hotel_booking/app/di/di.dart';
import 'package:hotel_booking/core/network/hive_service.dart';

void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Handle errors in the root isolate
  Isolate.current.addErrorListener(RawReceivePort((pair) {
    final List<dynamic> errorAndStacktrace = pair;
    print('Error: ${errorAndStacktrace.first}');
    print('Stack trace: ${errorAndStacktrace.last}');
  }).sendPort);

  // Initialize services
  await HiveService().init();
  await initDependencies();

  // Run the app
  runApp(const MyApp());
}
// 