import 'package:flutter/widgets.dart';
import '../app_assets.dart';

class ScreenBg extends StatelessWidget {
  final Widget child;
  const ScreenBg({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        AppAssets.bgImg,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      child
    ]);
  }
}
