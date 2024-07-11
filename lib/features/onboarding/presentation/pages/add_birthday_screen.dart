import 'package:astrology/core/widgets/main_btn.dart';
import 'package:astrology/core/widgets/screen_bg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_colors.dart';

class AddBirthDayScreen extends StatefulWidget {
  static const routeName = "/add-birthday-screen";
  const AddBirthDayScreen({super.key});

  @override
  State<AddBirthDayScreen> createState() => _AddBirthDayScreenState();
}

class _AddBirthDayScreenState extends State<AddBirthDayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBg(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const RSizedBox(height: 40),
              LinearProgressIndicator(
                value: 0.33,
                color: AppColors.primaryYellow,
                backgroundColor: AppColors.lightPurple,
              ),
              const RSizedBox(height: 10),
              Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.arrow_back))),
              const RSizedBox(height: 20),
              Text(
                'Date Of Birth',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const RSizedBox(height: 100),
              RSizedBox(
                height: 300,
                child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: DateTime(1990),
                    maximumDate: DateTime.now(),
                    onDateTimeChanged: (date) {}),
              ),
              const Expanded(child: SizedBox()),
              MainBtn(
                  lbl: 'Continue',
                  bgColor: AppColors.primaryYellow,
                  onClick: () {}),
              const RSizedBox(height: 40)
            ],
          ),
        ),
      ),
    );
  }
}
