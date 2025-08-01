import 'package:flutter/material.dart';
import 'package:modeni_app/core/theme/text_styles.dart';
import 'package:modeni_app/core/widget/text_field_title.dart';
import 'package:modeni_app/features/user/presentation/widgets/role_btn.dart';

import '../../../../core/global/globals.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/padding.dart';
import '../../../../core/theme/sizedbox.dart';
import '../../../../core/widget/basic_btn.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widget/primary_app_bar.dart';

class SignupRolePage extends StatefulWidget {
  const SignupRolePage({super.key});

  @override
  State<SignupRolePage> createState() => _SignupRolePageState();
}

class _SignupRolePageState extends State<SignupRolePage> {
  final TextEditingController roleController = TextEditingController();
  bool isButtonEnabled = false;
  int? selectedIndex; // 선택된 index 저장
  bool isNoContent = false;

  @override
  void initState() {
    super.initState();
    roleController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    final hasText = roleController.text.trim().isNotEmpty;
    final hasSelection = selectedIndex != null;

    final shouldEnable = hasText || hasSelection;

    if (isButtonEnabled != shouldEnable) {
      setState(() {
        isButtonEnabled = shouldEnable;
      });
    }
  }


  @override
  void dispose() {
    roleController.dispose();
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
              value: 0.4,
              backgroundColor: AppColors.lightGreyColor,
              color: AppColors.primaryColor,
            ),
          ),
          Spacer(),
          Text("나는 누구인가요?",
              style: AppTextStyles.semiBold18.copyWith(color: AppColors.primaryColor)),
          AppSizedBox.h54SizedBox,
          SizedBox(
            width: 200,
            height: 300,
            child: GridView.builder(
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // ✅ 가로에 3개
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1, // 정사각형
              ),
              itemBuilder: (context, index) {
                final item = Globals.roleList[index];
                final isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selectedIndex == index) {
                        selectedIndex = null;
                      } else {
                        selectedIndex = index;
                      }
                      _updateButtonState(); // 중요
                    });
                  },
                  child: RoleBtn(
                    role: item,
                    isSelected: isSelected, // 선택 상태 전달
                  ),
                );
              },
            ),
          ),
          AppSizedBox.h54SizedBox,
          InkWell(
            onTap: () {
              setState(() {
                isNoContent = !isNoContent;
              });
            },
              child: Text("위의 내용 중 없으신가요?", style: AppTextStyles.medium12.copyWith(color: AppColors.greyColor),)),
          isNoContent ? Padding(
            padding: AppPadding.h60v16Padding,
            child: TextFieldTitle(
              controller: roleController,
              hintText: "직접 입력해 주세요.",
            ),
          ) : SizedBox(),
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

