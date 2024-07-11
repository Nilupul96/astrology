import 'package:astrology/core/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/widgets/main_btn.dart';
import '../../../../core/widgets/screen_bg.dart';

class OnboardingSuccessScreen extends StatefulWidget {
  static const routeName = "/onboarding-complete";
  const OnboardingSuccessScreen({super.key});

  @override
  State<OnboardingSuccessScreen> createState() =>
      _OnboardingSuccessScreenState();
}

class _OnboardingSuccessScreenState extends State<OnboardingSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBg(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RSizedBox(
                      height: 120, child: Image.asset(AppAssets.addDateBg)),
                  RSizedBox(
                    height: 70,
                  ),
                  Text(
                    "Congratulations!",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  RSizedBox(
                    height: 20,
                  ),
                  Text(
                    "You've successfully completed account creation.Please continue to home see your astrology details.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  RSizedBox(
                    height: 50,
                  ),
                  MainBtn(
                      lbl: 'Continue to Home',
                      bgColor: AppColors.primaryYellow,
                      onClick: () async {}),
                ],
              ))),
    );
  }
}
