import 'package:flutter/material.dart';
import 'package:modeni_app/core/global/globals.dart';
import 'package:modeni_app/core/widget/drop_down_form.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/padding.dart';
import '../../../../core/theme/sizedbox.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widget/basic_btn.dart';
import '../../../../core/widget/primary_app_bar.dart';
import 'package:go_router/go_router.dart';

class SignupRegionPage extends StatefulWidget {
  const SignupRegionPage({super.key});

  @override
  State<SignupRegionPage> createState() => _SignupRegionPageState();
}

class _SignupRegionPageState extends State<SignupRegionPage> {
  String? selectedRegion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PrimaryAppbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: AppPadding.h20Padding,
            child: LinearProgressIndicator(
              value: 0.8,
              backgroundColor: AppColors.lightGreyColor,
              color: AppColors.primaryColor,
            ),
          ),
          Spacer(),
          Text("거주지역을 선택해 주세요",
              style: AppTextStyles.semiBold18.copyWith(color: AppColors.primaryColor)),
          AppSizedBox.h54SizedBox,
          Padding(
            padding: AppPadding.h20Padding,
            child: DropDownForm(list: Globals.regionList,
              onChange: (String region) { selectedRegion = region;},
            ),
          ),
          Spacer()
        ],
      ),
      bottomNavigationBar: Padding(
        padding: AppPadding.v16Padding,
        child: BasicBtn(
          btnText: "다음",
          textColor: AppColors.whiteColor,
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            context.push("/signup_connection");
          },
        ),
      ),
    );
  }
}
