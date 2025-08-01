import 'package:flutter/material.dart';
import 'package:modeni_app/core/theme/text_styles.dart';
import 'package:modeni_app/core/widget/text_field_title.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/padding.dart';
import '../../../../core/theme/sizedbox.dart';
import '../../../../core/widget/basic_btn.dart';
import 'package:go_router/go_router.dart';

class SignupNamePage extends StatefulWidget {
  const SignupNamePage({super.key});

  @override
  State<SignupNamePage> createState() => _SignupNamePageState();
}

class _SignupNamePageState extends State<SignupNamePage> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppSizedBox.h54SizedBox,
          LinearProgressIndicator(
            value: 0.3,
            backgroundColor: AppColors.lightGreyColor,
            color: AppColors.primaryColor,
          ),
          Spacer(),
          Text("이름을 입력해 주세요.", style: AppTextStyles.semiBold18.copyWith(color: AppColors.primaryColor),),
          AppSizedBox.h54SizedBox,
          Image.asset(
            "lib/core/images/modeni_logo.png",
            scale: 1.2,),
          AppSizedBox.h54SizedBox,
          Padding(
            padding: AppPadding.h20Padding,
            child: TextFieldTitle(
                controller: nameController,
                hintText: "이름을 입력해 주세요.",
            ),
          ),
          Spacer(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: AppPadding.v16Padding,
        child: BasicBtn(btnText: "다음",
            textColor: AppColors.whiteColor,
            backgroundColor: AppColors.primaryColor,
            onPressed: (){
              context.push("/signup_role");
            }
        ),
      ),
    );
  }
}
