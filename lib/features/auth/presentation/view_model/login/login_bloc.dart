import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/core/common/snackbar/my_snackbar.dart';
import 'package:hotel_booking/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:hotel_booking/features/dashboard1/dashboard_view.dart';
import 'package:hotel_booking/features/home/presentation/view_model/home_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './login_state.dart';

part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final RegisterBloc _registerBloc;
  final HomeCubit _homeCubit;
  final SharedPreferences _prefs;

  LoginBloc({
    required RegisterBloc registerBloc,
    required HomeCubit homeCubit,
    required SharedPreferences prefs,
  })  : _registerBloc = registerBloc,
        _homeCubit = homeCubit,
        _prefs = prefs,
        super(LoginState.initial()) {
    on<NavigateRegisterScreenEvent>((event, emit) {
      Navigator.push(
        event.context,
        MaterialPageRoute(
          builder: (context) => BlocProvider.value(
              value: _registerBloc, child: event.destination),
        ),
      );
    });

    on<LoginUserEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));

      // Hardcoded credentials for testing
      if (event.email == "user@test.com" && event.password == "user123") {
        // User login
        await _prefs.setString('user_role', 'user');
        emit(state.copyWith(isLoading: false, isSuccess: true));

        if (!event.context.mounted) return;
        Navigator.pushReplacement(
          event.context,
          MaterialPageRoute(
            builder: (context) => DashboardView(),
          ),
        );
      } else {
        // Invalid credentials
        emit(state.copyWith(isLoading: false, isSuccess: false));
        if (!event.context.mounted) return;
        showMySnackBar(
          context: event.context,
          message: "Invalid credentials. Use user@test.com/user123",
          color: Colors.red,
        );
      }
    });
  }
}
