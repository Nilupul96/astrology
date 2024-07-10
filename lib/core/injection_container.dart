import 'package:astrology/features/auth/domain/usecases/fetch_user_profile_usecase.dart';
import 'package:astrology/features/settings/domain/usecases/signout_usecaase.dart';
import 'package:get_it/get_it.dart';
import '../features/auth/data/datasources/auth_service.dart';
import '../features/auth/data/repositories/auth_repository_impl.dart';
import '../features/auth/domain/repositories/auth_repository.dart';
import '../features/auth/domain/usecases/authState_changes_usecase.dart';
import '../features/auth/domain/usecases/sign_in_with_google.dart';
import '../features/auth/presentation/bloc/auth_bloc.dart';
import '../features/home/presentation/bloc/home_bloc.dart';
import '../features/settings/data/datasources/setting_service.dart';
import '../features/settings/data/repositories/setting_repository_impl.dart';
import '../features/settings/domain/repositories/settings_repository.dart';
import '../features/settings/presentation/bloc/settings_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl<SignInWithGoogleUseCase>(),
      sl<FetchUserProfileUseCase>(), sl<AuthStateChangesUseCase>()));
  sl.registerLazySingleton<SignInWithGoogleUseCase>(
      () => SignInWithGoogleUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton<FetchUserProfileUseCase>(
      () => FetchUserProfileUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton<AuthStateChangesUseCase>(
      () => AuthStateChangesUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sl<AuthService>()));
  sl.registerLazySingleton<AuthService>(() => AuthServiceImpl());

  //Settings screen
  sl.registerFactory<SettingsBloc>(() => SettingsBloc(sl<SignOutUseCase>()));
  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(sl<SettingRepository>()));
  sl.registerLazySingleton<SettingRepository>(
      () => SettingRepositoryImpl(sl<SettingService>()));
  sl.registerLazySingleton<SettingService>(() => SettingServiceImpl());
  sl.registerFactory<HomeBloc>(() => HomeBloc());
}
