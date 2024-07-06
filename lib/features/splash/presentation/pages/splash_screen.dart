import 'package:astrology/core/app_assets.dart';
import 'package:astrology/features/home/presentation/pages/home_screen.dart';
import 'package:astrology/features/login/presentation/pages/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../bloc/splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splash-screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkCurrentUserState();
    super.initState();
  }

  Future<void> checkCurrentUserState() async {
    Future.delayed(Duration(seconds: 2), () {
      context.read<SplashBloc>().add(CheckUserAuthStateEvent());
    });
  }

  void manageUserNavigation(User? user) {
    if (user != null) {
      context.pushReplacementNamed(HomeScreen.routeName);
      return;
    }
    context.pushReplacementNamed(SignInScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashSusses) {
          manageUserNavigation(state.user);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Image.asset(
              AppAssets.bgImg,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
                right: -450.w,
                top: 0,
                bottom: 0,
                child: Image.asset(AppAssets.signChart))
          ],
        );
      },
    ));
  }
}
