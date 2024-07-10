import 'package:astrology/core/app_assets.dart';
import 'package:astrology/core/helpers/navigation_service.dart';
import 'package:astrology/core/widgets/snackbar_dialog.dart';
import 'package:astrology/features/auth/domain/entities/user.dart';
import 'package:astrology/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/sign_in_screen.dart';

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
    Future.delayed(const Duration(seconds: 2), () {
      context.read<AuthBloc>().add(ListenAuthStateChanges());
    });
  }

  void manageUserNavigation(UserEntity? user) {
    if (user != null) {
      context.pushReplacementNamed(HomeScreen.routeName, extra: user);
      return;
    }
    context.pushReplacementNamed(SignInScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthStateSuccess) {
          context.read<AuthBloc>().add(FetchUserProfile(state.user.uid));
        }

        if (state is AuthSuccess) {
          manageUserNavigation(state.user);
        }
        if (state is AuthError) {
          SnackBarDialog.showSnackBar(context, '${state.exception.message}');
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
