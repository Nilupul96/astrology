import 'package:astrology/features/onboarding/presentation/pages/set_zodiac_sign_screen.dart';
import 'package:astrology/features/onboarding/presentation/widgets/stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/widgets/main_btn.dart';
import '../../../../core/widgets/main_text_field.dart';
import '../../../../core/widgets/screen_bg.dart';
import '../../../auth/data/models/user_model.dart';

class SetNameScreen extends StatefulWidget {
  static const routeName = "/set-name-screen";
  final UserData? user;
  const SetNameScreen({super.key, this.user});

  @override
  State<SetNameScreen> createState() => _SetNameScreenState();
}

class _SetNameScreenState extends State<SetNameScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _nameController.text = widget.user?.name ?? '';
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBg(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const RSizedBox(height: 40),
                  const CustomStepper(
                    value: 0.2,
                  ),
                  const RSizedBox(height: 10),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back))),
                  const RSizedBox(height: 50),
                  Text(
                    'Enter your Name',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const RSizedBox(height: 20),
                  Text(
                    'Tell us about yourself so that we can make a more professional prediction',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: Colors.grey),
                  ),
                  const RSizedBox(height: 100),
                  CustomTextFormField(
                    labelText: 'Name',
                    keyboardType: TextInputType.name,
                    textEditingController: _nameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    hintText: "Please Enter your name",
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Name is required";
                      }
                      return null;
                    },
                  ),
                  const RSizedBox(height: 40),
                  MainBtn(
                      lbl: 'Continue',
                      bgColor: AppColors.primaryYellow,
                      onClick: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          context.pushNamed(SetZodiacScreen.routeName);
                        }
                        _nameController.clear();
                        FocusScope.of(context).unfocus();
                      }),
                  const RSizedBox(height: 40)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
