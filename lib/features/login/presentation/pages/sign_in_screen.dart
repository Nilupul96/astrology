import 'package:astrology/core/app_colors.dart';
import 'package:astrology/core/app_icons.dart';
import 'package:astrology/core/widgets/main_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_assets.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
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
                  turns: _animation, child: Image.asset(AppAssets.signChart)),
              const RSizedBox(height: 100),
              MainBtn(
                  lbl: 'Sign In with Google',
                  bgColor: AppColors.white.withOpacity(0.2),
                  icon: AppIcon.googleIcon,
                  onClick: () {}),
              const RSizedBox(height: 100)
            ],
          ),
        )
      ],
    ));
  }
}
