import 'package:astrology/core/widgets/screen_bg.dart';
import 'package:astrology/features/auth/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  final UserEntity user;
  static const routeName = "/profile-screen";
  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBg(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Stack(
            children: [
              IconButton(
                  onPressed: () => context.pop(),
                  icon: Icon(
                    Icons.close,
                    size: 30,
                  )),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RSizedBox(height: 40),
                      Hero(
                        tag: "${widget.user.name}",
                        child: Center(
                          child: Text(
                            "${widget.user.name}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
