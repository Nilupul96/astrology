import 'package:astrology/core/widgets/screen_bg.dart';
import 'package:astrology/features/predictions/people_predictions/presentation/pages/people_prediction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/app_colors.dart';
import '../../../../../core/app_const.dart';

class ZodiacSignListScreen extends StatefulWidget {
  static const routeName = "/zodiac-sign-list-screen";
  const ZodiacSignListScreen({Key? key}) : super(key: key);

  @override
  State<ZodiacSignListScreen> createState() => _ZodiacSignListScreenState();
}

class _ZodiacSignListScreenState extends State<ZodiacSignListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: ScreenBg(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const RSizedBox(
                height: 100,
              ),
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      childAspectRatio: 0.8),
                  padding: const EdgeInsets.all(8.0),
                  physics: const ClampingScrollPhysics(),
                  itemCount: AppConst.zodiacSignList.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        context.pushNamed(
                          PeoplePredictionsResultScreen.routeName,
                        );
                      },
                      child: Card(
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        elevation: 10,
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.black,
                              image: DecorationImage(
                                  opacity: 0.3,
                                  image: AssetImage(
                                      AppConst.zodiacSignList[index].image),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(16)),
                          child: Center(
                            child: Hero(
                              tag: AppConst.zodiacSignList[index].name,
                              child: Text(
                                AppConst.zodiacSignList[index].name,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(color: AppColors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
              const RSizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
