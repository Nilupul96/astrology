import 'package:astrology/core/widgets/main_dropdown.dart';
import 'package:astrology/core/widgets/screen_bg.dart';
import 'package:astrology/core/zodiac_sign_model.dart';
import 'package:astrology/features/onboarding/presentation/pages/onboarding_succsess_screen.dart';
import 'package:astrology/features/onboarding/presentation/widgets/stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_const.dart';
import '../../../../core/widgets/main_btn.dart';

class SetZodiacScreen extends StatefulWidget {
  static const routeName = "/set-zodiac-screen";
  const SetZodiacScreen({super.key});

  @override
  State<SetZodiacScreen> createState() => _SetZodiacScreenState();
}

class _SetZodiacScreenState extends State<SetZodiacScreen> {
  ZodiacSign selectedZodiacSign = AppConst.zodiacSignList.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBg(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const RSizedBox(height: 40),
                  const CustomStepper(
                    value: 0.6,
                  ),
                  const RSizedBox(height: 10),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          onPressed: () {
                            context.pop();
                          },
                          icon: const Icon(Icons.arrow_back))),
                  const RSizedBox(height: 20),
                  Text(
                    'Select Your Zodiac sign',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const RSizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: MainDropDown(
                        hint: selectedZodiacSign.name,
                        items: AppConst.zodiacSignList,
                        onSelect: (value) {
                          setState(() {
                            selectedZodiacSign = value;
                          });
                        },
                        defaultValue: ""),
                  ),
                  const RSizedBox(height: 40),
                  SizedBox(
                          height: 300,
                          child: Image.asset(selectedZodiacSign.image))
                      .animate()
                      .fadeIn(),
                  const RSizedBox(height: 20),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 40.h),
                child: MainBtn(
                    lbl: 'Continue',
                    bgColor: AppColors.primaryYellow,
                    onClick: () async {
                      context.pushNamed(OnboardingSuccessScreen.routeName);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
