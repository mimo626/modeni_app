import 'package:flutter/material.dart';
import 'package:modeni_app/core/theme/text_styles.dart';
import 'package:modeni_app/core/widget/primary_app_bar.dart';
import 'package:modeni_app/core/widget/text_field_title.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/padding.dart';
import '../../../../core/theme/sizedbox.dart';
import '../../../../core/widget/basic_btn.dart';
import 'package:go_router/go_router.dart';

import '../../../../main.dart';

class SignupAgePage extends StatefulWidget {
  const SignupAgePage({super.key});

  @override
  State<SignupAgePage> createState() => _SignupAgePageState();
}

class _SignupAgePageState extends State<SignupAgePage> {
  final TextEditingController ageController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    ageController.addListener(_onAgeChanged);
  }

  void _onAgeChanged() {
    setState(() {
      isButtonEnabled = ageController.text.trim().isNotEmpty;
    });
  }

  @override
  void dispose() {
    ageController.dispose();
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
              value: 0.5,
              backgroundColor: AppColors.lightGreyColor,
              color: AppColors.primaryColor,
            ),
          ),
          Spacer(),
          Text("나이을 입력해 주세요",
              style: AppTextStyles.semiBold18.copyWith(color: AppColors.primaryColor)),
          AppSizedBox.h54SizedBox,
          Image.asset(
            "lib/core/images/maingreen_smile.png",
            scale: 10,
          ),
          AppSizedBox.h54SizedBox,
          Padding(
            padding: AppPadding.h60v16Padding,
            child: TextFieldTitle(
              controller: ageController,
              hintText: "만 나이로 입력해 주세요.",
              keyboardType: TextInputType.number,
            ),
          ),
          Spacer(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: AppPadding.v16Padding,
        child: BasicBtn(
          btnText: "다음",
          textColor: AppColors.whiteColor,
          backgroundColor: isButtonEnabled
              ? AppColors.primaryColor
              : AppColors.lightGreyColor,
          onPressed: () {
            if (isButtonEnabled) {
              setState(() {
                // 유저 정보 저장
                user_controller.age.value = int.parse(ageController.text);
                context.push("/signup_role");
              });
            }
            else {
              null;
            }
          },
        ),
      ),
    );
  }
}

