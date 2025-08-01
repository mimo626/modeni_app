import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/padding.dart';
import '../../../../core/widget/basic_btn.dart';
import 'package:modeni_app/core/theme/text_styles.dart';
import 'package:modeni_app/core/widget/primary_app_bar.dart';

import '../../../../core/theme/sizedbox.dart';
import 'package:go_router/go_router.dart';
class SignupConnectionPage extends StatefulWidget {
  const SignupConnectionPage({super.key});

  @override
  State<SignupConnectionPage> createState() => _SignupConnectionPageState();
}

class _SignupConnectionPageState extends State<SignupConnectionPage> {
  bool isGetCode = false;

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
          Text("가족 연결 후 모드니를 사용해 보세요!",
              style: AppTextStyles.semiBold18.copyWith(color: AppColors.primaryColor)),
          AppSizedBox.h54SizedBox,
          Image.asset(
            "lib/core/images/maingreen_zz.png",
            scale: 10,
          ),
          isGetCode ? Column(
            children: [
              AppSizedBox.h24SizedBox,
              Text("가족 연결 코드", style: AppTextStyles.medium16.copyWith(color: AppColors.darkGreyColor, ),),
              AppSizedBox.h8SizedBox,
              Text("dkfjdkf", style: AppTextStyles.medium14.copyWith(color: AppColors.darkGreyColor, ),),
            ],
          ) : SizedBox(),
          Spacer(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: AppPadding.v16Padding,
        child: Padding(
          padding: AppPadding.h20Padding,
          child: isGetCode ?
          BasicBtn(
            padding: EdgeInsets.zero,
            btnText: "완료하기",
            textColor: AppColors.whiteColor,
            backgroundColor: AppColors.primaryColor,
            onPressed: () {
              context.push("/signup_finish");
            },
          )
              :
          Row(
            children: [
              Expanded(
                child: BasicBtn(
                  padding: EdgeInsets.zero,
                  btnText: "코드 발급받기",
                  textColor: AppColors.whiteColor,
                  backgroundColor: AppColors.primaryColor,
                  onPressed: () {
                    setState(() {
                      isGetCode = true;
                    });
                  },
                ),
              ),
              AppSizedBox.w16SizedBox,
              Expanded(
                child: BasicBtn(
                  padding: EdgeInsets.zero,
                  btnText: "코드로 연결하기",
                  textColor: AppColors.primaryColor,
                  backgroundColor: AppColors.whiteColor,
                  borderColor: AppColors.primaryColor,
                  onPressed: () {
                    context.push("/signup_code");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
