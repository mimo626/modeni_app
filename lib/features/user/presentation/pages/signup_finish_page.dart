import 'dart:async';

import 'package:flutter/material.dart';
import 'package:modeni_app/core/theme/text_styles.dart';
import 'package:modeni_app/core/widget/primary_app_bar.dart';
import 'package:modeni_app/core/widget/text_field_title.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/padding.dart';
import '../../../../core/theme/sizedbox.dart';
import '../../../../core/widget/basic_btn.dart';
import 'package:go_router/go_router.dart';

class SignupFinishPage extends StatefulWidget {
  const SignupFinishPage({super.key});

  @override
  State<SignupFinishPage> createState() => _SignupFinishPageState();
}

class _SignupFinishPageState extends State<SignupFinishPage> {
  bool _showFirst = true;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _showFirst = !_showFirst;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PrimaryAppbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: AppPadding.h20Padding,
            child: LinearProgressIndicator(
              value: 1,
              backgroundColor: AppColors.lightGreyColor,
              color: AppColors.primaryColor,
            ),
          ),
          Spacer(),
          Text("회원가입 완료!\n모드니에 오신 걸 환영합니다.",
              textAlign: TextAlign.center,
              style: AppTextStyles.semiBold18.copyWith(color: AppColors.primaryColor)),
          AppSizedBox.h54SizedBox,
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _showFirst
                ? Image.asset(
              "lib/core/images/maingreen_smile.png",
              scale: 10,
              key: const ValueKey(1),
            )
                : Image.asset(
              "lib/core/images/maingreen_zz.png",
              scale: 10,
              key: const ValueKey(2),
            ),
          ),
          Spacer(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: AppPadding.v16Padding,
        child: BasicBtn(
          btnText: "시작하기",
          textColor: AppColors.whiteColor,
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            context.push("/signup_finish");
          },
        ),
      ),
    );
  }
}