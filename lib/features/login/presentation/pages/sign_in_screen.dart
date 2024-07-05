import 'package:astrology/core/app_colors.dart';
import 'package:astrology/core/app_icons.dart';
import 'package:astrology/core/widgets/main_btn.dart';
import 'package:astrology/core/widgets/progress_dialog.dart';
import 'package:astrology/core/widgets/snackbar_dialog.dart';
import 'package:astrology/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/app_assets.dart';
import '../bloc/login_bloc.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = "/sign-in-screen";
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: Duration(seconds: 60), vsync: this)
        ..repeat(reverse: false);

  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.linear);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> signInWithGoogle() async {
    context.read<LoginBloc>().add(SignInWithGoogle());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          ProgressDialog progressDialog = ProgressDialog(context);
          progressDialog.show();
        }
        if (state is LoginInSuccess) {
          context.goNamed(HomeScreen.routeName);
        }
        if (state is LogInError) {
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RotationTransition(
                      turns: _animation,
                      child: Image.asset(AppAssets.signChart)),
                  const RSizedBox(height: 100),
                  MainBtn(
                      lbl: 'Sign In with Google',
                      bgColor: AppColors.white.withOpacity(0.2),
                      icon: AppIcon.googleIcon,
                      onClick: signInWithGoogle),
                  const RSizedBox(height: 100)
                ],
              ),
            )
          ],
        );
      },
    ));
  }
}
