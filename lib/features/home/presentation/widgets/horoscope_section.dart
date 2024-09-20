import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_const.dart';

class HoroscopeSection extends StatefulWidget {
  const HoroscopeSection({super.key});

  @override
  State<HoroscopeSection> createState() => _HoroscopeSectionState();
}

class _HoroscopeSectionState extends State<HoroscopeSection> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _categoryMenuList(),
        const RSizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            "Today, you might find yourself more focused on personal growth and self-improvement. It's a good day to set new goals and work on developing your skills. Avoid distractions and stay committed to your path.\n\nIn your love life, communication is key. Open up about your feelings and listen to your partner's needs. Single Virgos might meet someone interesting through a shared hobby or interest.",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        )
      ],
    );
  }

  Widget _categoryMenuList() {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      height: 50.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: AppConst.HOROSCOPE_OPTION_LIST.length,
          primary: true,
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20.w),
                  decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? AppColors.primaryYellow
                          : AppColors.lightPurple,
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 12.h),
                    child: Text(
                      AppConst.HOROSCOPE_OPTION_LIST[index],
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: selectedIndex != index
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
