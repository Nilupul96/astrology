import 'package:astrology/core/app_colors.dart';
import 'package:astrology/core/widgets/screen_bg.dart';
import 'package:astrology/features/settings/presentation/pages/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../auth/domain/entities/user.dart';
import '../bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  final UserEntity? user;
  static const routeName = "/home-screen";
  const HomeScreen({super.key, this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        actions: [
          IconButton(
              onPressed: () {
                context.pushNamed(SettingsScreen.routeName);
              },
              icon: Icon(
                Icons.settings,
                color: AppColors.white,
              ))
        ],
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ScreenBg(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RSizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Good morning ${widget.user?.name}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
