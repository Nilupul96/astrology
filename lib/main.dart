import 'package:astrology/core/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/app_routes.dart';
import 'core/injection_container.dart';
import 'features/login/presentation/bloc/login_bloc.dart';
import 'features/splash/presentation/bloc/splash_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(392, 783),
        minTextAdapt: true,
        builder: (_, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<LoginBloc>(create: (context) => sl()),
              BlocProvider<SplashBloc>(create: (context) => sl())
            ],
            child: MaterialApp.router(
              title: 'Template',
              theme: AppTheme.appLightTheme,
              darkTheme: AppTheme.darkTheme,
              routerConfig: AppRoutes.router,
            ),
          );
        });
  }
}
