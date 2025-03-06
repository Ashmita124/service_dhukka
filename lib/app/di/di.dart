import 'package:get_it/get_it.dart';
import 'package:hotel_booking/core/network/hive_service.dart';
import 'package:hotel_booking/features/auth/data/data_source/local_datasource/local_datasource.dart';
import 'package:hotel_booking/features/auth/data/repositories/user_local_repository.dart';
import 'package:hotel_booking/features/auth/domain/use_case/create_user_usecase.dart';
import 'package:hotel_booking/features/auth/domain/use_case/upload_image_usecase.dart';
import 'package:hotel_booking/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:hotel_booking/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:hotel_booking/features/home/presentation/view_model/home_cubit.dart';
import 'package:hotel_booking/features/onBoarding/presentation/view_model/onboarding_cubit.dart';
import 'package:hotel_booking/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await _initHiveService();
  await _initSharedPreferences();

  await _initHomeDependencies();
  await _initRegisterDependencies();
  await _initLoginDependencies();
  await _initOnBoardingScreenDependencies();
  await _initSplashScreenDependencies();
}

Future<void> _initSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}

_initHiveService() async {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

_initRegisterDependencies() async {
  getIt.registerFactory<UserLocalDataSource>(() => UserLocalDataSource(getIt()));
  getIt.registerLazySingleton<UserLocalRepository>(() =>
      UserLocalRepository(userLocalDataSource: getIt<UserLocalDataSource>()));

  getIt.registerLazySingleton<CreateUserUsecase>(
    () => CreateUserUsecase(userRepository: getIt<UserLocalRepository>()),
  );

  getIt.registerLazySingleton<UploadImageUsecase>(
    () => UploadImageUsecase(getIt<UserLocalRepository>()),
  );

  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      createUserUsecase: getIt<CreateUserUsecase>(),
      uploadImageUsecase: getIt<UploadImageUsecase>(),
    ),
  );
}

_initOnBoardingScreenDependencies() async {
  getIt.registerFactory(() => OnboardingCubit(getIt<LoginBloc>()));
}

_initHomeDependencies() async {
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
}

_initLoginDependencies() async {
  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
      prefs: getIt<SharedPreferences>(),
    ),
  );
}

_initSplashScreenDependencies() async {
  getIt.registerFactory(() => SplashCubit(getIt<OnboardingCubit>()));
}
