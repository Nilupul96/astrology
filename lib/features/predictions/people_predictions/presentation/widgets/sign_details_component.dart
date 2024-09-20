import 'package:flutter/material.dart';
import '../../../../../core/app_colors.dart';

class SignDetailsComponent extends StatelessWidget {
  final String title;
  final String value;
  const SignDetailsComponent(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("$title :", style: textTheme.displayMedium),
          const SizedBox(
            width: 20,
          ),
          Text(value,
              style: textTheme.displayMedium!.copyWith(
                  color: AppColors.primaryYellow, fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
