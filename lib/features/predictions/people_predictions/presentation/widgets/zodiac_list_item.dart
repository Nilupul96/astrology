import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/app_colors.dart';
import '../../../../../core/zodiac_sign_model.dart';

class ZodiacListItem extends StatelessWidget {
  final ZodiacSign zodiacSign;
  const ZodiacListItem({super.key, required this.zodiacSign});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Hero(
            tag: zodiacSign.name,
            child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.1),
                    image: DecorationImage(
                        opacity: 0.8,
                        image: AssetImage(zodiacSign.image),
                        fit: BoxFit.contain),
                    borderRadius: BorderRadius.circular(16))),
          ),
        ),
        const RSizedBox(height: 10),
        Center(
          child: Text(
            zodiacSign.name,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: AppColors.primaryYellow),
          ),
        ),
      ],
    );
  }
}
