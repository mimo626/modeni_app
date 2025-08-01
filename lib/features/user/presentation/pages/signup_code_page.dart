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

class SignupCodePage extends StatefulWidget {
  const SignupCodePage({super.key});

  @override
  State<SignupCodePage> createState() => _SignupCodePageState();
}

class _SignupCodePageState extends State<SignupCodePage> {
  final TextEditingController codeController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    codeController.addListener(_onCodeChanged);
  }

  void _onCodeChanged() {
    setState(() {
      isButtonEnabled = codeController.text.trim().isNotEmpty;
    });
  }

  @override
  void dispose() {
    codeController.dispose();
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
              value: 0.9,
              backgroundColor: AppColors.lightGreyColor,
              color: AppColors.primaryColor,
            ),
          ),
          Spacer(),
          Text("코드를 입력해 주세요.",
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
              controller: codeController,
              hintText: "코드를 입력해 주세요.",
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
                //TODO 코드에 대한 유효성 검사 필요
                user_controller.family_code.value = BigInt.parse(codeController.text);

                context.push("/signup_finish");
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