import 'package:astrology/core/widgets/screen_bg.dart';
import 'package:astrology/core/zodiac_sign_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      body: const ScreenBg(
        child: Column(
          children: [
            RSizedBox(
              height: 100,
            ),
            Text("Result screen")
          ],
        ),
      ),
    );
  }
}
