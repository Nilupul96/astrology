import 'package:astrology/core/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/app_routes.dart';
import 'core/injection_container.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/predictions/people_predictions/presentation/bloc/people_predictions_bloc.dart';
import 'features/settings/presentation/bloc/settings_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(392, 783),
        minTextAdapt: true,
        builder: (_, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<AuthBloc>(create: (context) => sl()),
              BlocProvider<SettingsBloc>(create: (context) => sl()),
              BlocProvider<HomeBloc>(create: (context) => sl()),
              BlocProvider<PeoplePredictionsBloc>(create: (context) => sl()),
            ],
            child: MaterialApp.router(
              title: 'Template',
              theme: AppTheme.appLightTheme,
              themeMode: ThemeMode.dark,
              darkTheme: AppTheme.darkTheme,
              routerConfig: AppRoutes.router,
            ),
          );
        });
  }
}
