import 'package:astrology/features/login/data/datasources/login_service.dart';
import 'package:astrology/features/login/data/repositories/login_repository_impl.dart';
import 'package:astrology/features/login/domain/repositories/login_repository.dart';
import 'package:astrology/features/login/domain/usecases/sign_in_with_google.dart';
import 'package:astrology/features/settings/domain/usecases/signout_usecaase.dart';
import 'package:astrology/features/splash/domain/repositories/splash_repository.dart';
import 'package:astrology/features/splash/domain/usecases/check_use_state_usecase.dart';
import 'package:get_it/get_it.dart';

import '../features/login/presentation/bloc/login_bloc.dart';
import '../features/settings/data/datasources/setting_service.dart';
import '../features/settings/data/repositories/setting_repository_impl.dart';
import '../features/settings/domain/repositories/settings_repository.dart';
import '../features/settings/presentation/bloc/settings_bloc.dart';
import '../features/splash/data/datasources/splash_service.dart';
import '../features/splash/data/repositories/splash_repository_impl.dart';
import '../features/splash/presentation/bloc/splash_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerFactory<SplashBloc>(
      () => SplashBloc(sl<CheckUserAuthStateUseCase>()));
  sl.registerLazySingleton<CheckUserAuthStateUseCase>(
      () => CheckUserAuthStateUseCase(sl<SplashRepository>()));
  sl.registerLazySingleton<SplashRepository>(
      () => SplashRepositoryImpl(sl<SplashService>()));
  sl.registerLazySingleton<SplashService>(() => SplashServiceImpl());

  sl.registerFactory<LoginBloc>(() => LoginBloc(sl<SignInWithGoogleUseCase>()));
  sl.registerLazySingleton<SignInWithGoogleUseCase>(
      () => SignInWithGoogleUseCase(sl<LoginRepository>()));
  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(sl<LoginService>()));
  sl.registerLazySingleton<LoginService>(() => LoginServiceImpl());

  //Settings screen
  sl.registerFactory<SettingsBloc>(() => SettingsBloc(sl<SignOutUseCase>()));
  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(sl<SettingRepository>()));
  sl.registerLazySingleton<SettingRepository>(
      () => SettingRepositoryImpl(sl<SettingService>()));
  sl.registerLazySingleton<SettingService>(() => SettingServiceImpl());
}
