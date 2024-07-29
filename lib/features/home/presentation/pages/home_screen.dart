import 'package:astrology/core/app_colors.dart';
import 'package:astrology/core/widgets/screen_bg.dart';
import 'package:astrology/core/widgets/title.dart';
import 'package:astrology/features/home/presentation/widgets/horoscope_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../auth/data/models/user_model.dart';
import '../../../auth/domain/entities/user.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../bloc/home_bloc.dart';
import '../widgets/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  final UserEntity? user;
  static const routeName = "/home-screen";
  const HomeScreen({super.key, this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserData? user;
  @override
  void initState() {
    user = (BlocProvider.of<AuthBloc>(context).state as AuthSuccess).user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      extendBodyBehindAppBar: true,
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ScreenBg(
            child: SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const RSizedBox(height: 130),
                    const CommonTitle(
                      title: "Horoscope",
                    ),
                    const HoroscopeSection(),
                    const CommonTitle(
                      title: "Daily Affirmation",
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.white.withOpacity(0.2)),
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.w, vertical: 30.h),
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Center(
                        child: Text(
                          "Pay attention to your diet and exercise routine.",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryYellow),
                        ),
                      ),
                    ),
                    const CommonTitle(
                      title: "Astrology Articles",
                    ),
                    ListView.builder(
                        itemCount: 6,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.white.withOpacity(0.2)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 25.w, vertical: 20.h),
                            margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 10.h),
                            child: Row(children: [
                              Expanded(
                                child: Text(
                                    "Pay attention to your diet and exercise routine.Pay attention to your diet and exercise routine.Pay attention to your diet and exercise routine.",
                                    textAlign: TextAlign.left,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                              )
                            ]),
                          );
                        })
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
