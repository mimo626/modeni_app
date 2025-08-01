import 'package:flutter/material.dart';
import 'package:modeni_app/core/theme/text_styles.dart';
import 'package:modeni_app/core/widget/primary_app_bar.dart';
import 'package:modeni_app/core/widget/text_field_title.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/padding.dart';
import '../../../../core/theme/sizedbox.dart';
import '../../../../core/widget/basic_btn.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    idController.addListener(_onInputChanged);
    passwordController.addListener(_onInputChanged);
  }

  void _onInputChanged() {
    final isIdFilled = idController.text.trim().isNotEmpty;
    final isPasswordFilled = passwordController.text.trim().isNotEmpty;

    final shouldEnable =
        isIdFilled && isPasswordFilled;

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PrimaryAppbar(title: "로그인",),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
              ? () => context.push("/")
              : () => null,
        ),
      ),
    );
  }
}
