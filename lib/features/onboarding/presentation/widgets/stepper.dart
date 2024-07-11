import 'package:flutter/material.dart';
import '../../../../core/app_colors.dart';

class CustomStepper extends StatefulWidget {
  final double value;
  const CustomStepper({super.key, required this.value});

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: widget.value,
      color: AppColors.primaryYellow,
      backgroundColor: AppColors.lightPurple,
    );
  }
}
