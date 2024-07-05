import 'package:astrology/features/login/data/datasources/login_service.dart';
import 'package:astrology/features/login/data/repositories/login_repository_impl.dart';
import 'package:astrology/features/login/domain/repositories/login_repository.dart';
import 'package:astrology/features/login/domain/usecases/sign_in_with_google.dart';
import 'package:get_it/get_it.dart';

import '../features/login/presentation/bloc/login_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerFactory<LoginBloc>(() => LoginBloc(sl<SignInWithGoogleUseCase>()));
  sl.registerLazySingleton<SignInWithGoogleUseCase>(
      () => SignInWithGoogleUseCase(sl<LoginRepository>()));
  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(sl<LoginService>()));
  sl.registerLazySingleton<LoginService>(() => LoginServiceImpl());
}
