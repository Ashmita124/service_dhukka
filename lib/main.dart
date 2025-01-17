import 'package:flutter/cupertino.dart';
import 'package:service_dhukka/app/app.dart';
import 'package:service_dhukka/app/di/di.dart';
import 'package:service_dhukka/core/network/hive_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService().init();
  await initDependencies();
  runApp(
    App(),
  );
}
