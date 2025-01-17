import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_dhukka/app/di/di.dart';
import 'package:service_dhukka/core/theme/app_theme.dart';
import 'package:service_dhukka/features/splash/presentation/view/splash_view.dart';
import 'package:service_dhukka/features/splash/presentation/view_model/splash_cubit.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Management',
      theme: AppTheme.getApplicationTheme(isDarkMode: false),
      home: BlocProvider.value(
        value: getIt<SplashCubit>(),
        child: SplashView(),
      ),
    );
  }
}
