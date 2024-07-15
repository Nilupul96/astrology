import 'package:astrology/core/widgets/screen_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../core/app_colors.dart';
import '../../core/app_const.dart';

class PredictionInitScreen extends StatefulWidget {
  static const routeName = "/prediction-init";
  const PredictionInitScreen({super.key});

  @override
  State<PredictionInitScreen> createState() => _PredictionInitScreenState();
}

class _PredictionInitScreenState extends State<PredictionInitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.lightPurple,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        )),
        title: const Text("Predictions"),
      ),
      body: ScreenBg(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              RSizedBox(
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
                  itemCount: AppConst.PREDICTIONS_MENU_LIST.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        context.pushNamed(
                          AppConst.PREDICTIONS_MENU_LIST[index]['route'],
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
                              // image: DecorationImage(
                              //     opacity: 0.3,
                              //     image: AssetImage(AppAssets.onboarding2),
                              //     fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(16)),
                          child: Center(
                            child: Hero(
                              tag: AppConst.PREDICTIONS_MENU_LIST[index]
                                  ['name'],
                              child: Text(
                                AppConst.PREDICTIONS_MENU_LIST[index]['name'],
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
            ],
          ),
        ),
      )),
    );
  }
}
