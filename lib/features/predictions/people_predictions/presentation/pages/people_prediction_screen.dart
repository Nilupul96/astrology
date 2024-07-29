import 'package:astrology/core/helpers/enum.dart';
import 'package:astrology/core/widgets/screen_bg.dart';
import 'package:astrology/core/zodiac_sign_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/sign_details_component.dart';

class PeoplePredictionsResultScreen extends StatefulWidget {
  final ZodiacSign? zodiacSign;
  static const routeName = "/people-prediction-result-screen";
  const PeoplePredictionsResultScreen({super.key, this.zodiacSign});

  @override
  State<PeoplePredictionsResultScreen> createState() =>
      _PeoplePredictionsResultScreenState();
}

class _PeoplePredictionsResultScreenState
    extends State<PeoplePredictionsResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(widget.zodiacSign?.name ?? ''),
        ),
        body: ScreenBg(
            child: widget.zodiacSign == null
                ? const Center(
                    child: Text('No data'),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(children: [
                      const RSizedBox(
                        height: 100,
                      ),
                      Hero(
                        tag: widget.zodiacSign!.name,
                        child: SizedBox(
                          height: 250.h,
                          child: Center(
                            child: Image.asset(widget.zodiacSign!.image),
                          ),
                        ),
                      ),
                      const RSizedBox(
                        height: 20,
                      ),
                      SignDetailsComponent(
                        title: "Planet",
                        value: widget.zodiacSign!.planet,
                      ),
                      SignDetailsComponent(
                        title: "Element",
                        value: widget.zodiacSign!.element.displayName,
                      ),
                      SignDetailsComponent(
                        title: "Symbol",
                        value: widget.zodiacSign!.symbol,
                      )
                    ]),
                  )));
  }
}
