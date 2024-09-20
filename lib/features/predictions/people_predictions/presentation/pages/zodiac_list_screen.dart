import 'package:astrology/core/widgets/screen_bg.dart';
import 'package:astrology/features/predictions/people_predictions/presentation/pages/people_prediction_screen.dart';
import 'package:astrology/features/predictions/people_predictions/presentation/widgets/zodiac_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/app_const.dart';
import '../bloc/people_predictions_bloc.dart';

class ZodiacSignListScreen extends StatefulWidget {
  static const routeName = "/zodiac-sign-list-screen";
  const ZodiacSignListScreen({super.key});

  @override
  State<ZodiacSignListScreen> createState() => _ZodiacSignListScreenState();
}

class _ZodiacSignListScreenState extends State<ZodiacSignListScreen> {
  @override
  void initState() {
    fetchBehaviorList();
    super.initState();
  }

  fetchBehaviorList() async {
    context.read<PeoplePredictionsBloc>().add(FetchPeopleBehaviorsList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: ScreenBg(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: BlocConsumer<PeoplePredictionsBloc, PeoplePredictionsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const RSizedBox(
                    height: 100,
                  ),
                  if (state is PeoplePredictionsSuccess)
                    GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                                    extra: {
                                      'sign': AppConst.zodiacSignList[index],
                                      'behavior': state.behaviorsList
                                          .firstWhere((element) =>
                                              element.name.toLowerCase() ==
                                              AppConst
                                                  .zodiacSignList[index].name
                                                  .toLowerCase())
                                    });
                              },
                              child: ZodiacListItem(
                                  zodiacSign: AppConst.zodiacSignList[index]));
                        }),
                  const RSizedBox(
                    height: 100,
                  ),
                ],
              ),
            );
          },
        ),
      )),
    );
  }
}
