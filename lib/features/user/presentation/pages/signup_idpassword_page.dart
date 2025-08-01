import 'package:flutter/material.dart';
import 'package:modeni_app/core/theme/text_styles.dart';
import 'package:modeni_app/core/widget/primary_app_bar.dart';
import 'package:modeni_app/core/widget/text_field_title.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/padding.dart';
import '../../../../core/theme/sizedbox.dart';
import '../../../../core/widget/basic_btn.dart';
import 'package:go_router/go_router.dart';

class SignupIdpasswordPage extends StatefulWidget {
  const SignupIdpasswordPage({super.key});

  @override
  State<SignupIdpasswordPage> createState() => _SignupIdpasswordPageState();
}

class _SignupIdpasswordPageState extends State<SignupIdpasswordPage> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    idController.addListener(_onInputChanged);
    passwordController.addListener(_onInputChanged);
    rePasswordController.addListener(_onInputChanged);
  }

  void _onInputChanged() {
    final isIdFilled = idController.text.trim().isNotEmpty;
    final isPasswordFilled = passwordController.text.trim().isNotEmpty;
    final isRePasswordFilled = rePasswordController.text.trim().isNotEmpty;
    final isPasswordMatch = passwordController.text == rePasswordController.text;

    final shouldEnable =
        isIdFilled && isPasswordFilled && isRePasswordFilled && isPasswordMatch;

    if (isButtonEnabled != shouldEnable) {
      setState(() {
        isButtonEnabled = shouldEnable;
      });
    }
  }

  @override
  void dispose() {
    idController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
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
              value: 0.1,
              backgroundColor: AppColors.lightGreyColor,
              color: AppColors.primaryColor,
            ),
          ),
          Spacer(),
          Text("회원가입을 시작할 게요!",
              style: AppTextStyles.semiBold18.copyWith(color: AppColors.primaryColor)),
          AppSizedBox.h54SizedBox,

          // 아이디 입력
          Padding(
            padding: AppPadding.h60v16Padding,
            child: TextFieldTitle(
              controller: idController,
              hintText: "아이디 입력",
            ),
          ),

          // 비밀번호 입력
          AppSizedBox.h16SizedBox,
          Padding(
            padding: AppPadding.h60v16Padding,
            child: TextFieldTitle(
              controller: passwordController,
              hintText: "비밀번호 입력",
            ),
          ),

          // 비밀번호 확인 입력
          Padding(
            padding: AppPadding.h60v16Padding,
            child: TextFieldTitle(
              controller: rePasswordController,
              hintText: "비밀번호 확인",
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
          onPressed: isButtonEnabled
              ? () => context.push("/signup_name")
              : () => null,
        ),
      ),
    );
  }
}
