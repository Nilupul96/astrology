import 'package:astrology/core/app_colors.dart';
import 'package:astrology/core/widgets/main_btn.dart';
import 'package:astrology/core/widgets/progress_dialog.dart';
import 'package:astrology/core/widgets/snackbar_dialog.dart';
import 'package:astrology/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/screen_bg.dart';
import '../../../auth/presentation/pages/sign_in_screen.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = "/settings-screen";
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late ProgressDialog _progressDialog;

  @override
  void initState() {
    _progressDialog = ProgressDialog(context);
    super.initState();
  }

  Future<void> signOut() async {
    context.read<SettingsBloc>().add(SignOutEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.transparent,
      ),
      body: BlocConsumer<SettingsBloc, SettingsState>(
        listener: (context, state) {
          if (state is SignOutLoading) {
            _progressDialog.show();
          }
          if (state is SignOutSuccess) {
            _progressDialog.hide();
            context.goNamed(SignInScreen.routeName);
          }
          if (state is SignOutError) {
            _progressDialog.hide();
            SnackBarDialog.showSnackBar(context, state.error);
          }
        },
        builder: (context, state) {
          return ScreenBg(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MainBtn(
                    lbl: "Sign Out",
                    bgColor: AppColors.white.withOpacity(0.2),
                    onClick: signOut),
                RSizedBox(
                  height: 40,
                )
              ],
            ),
          ));
        },
      ),
    );
  }
}
