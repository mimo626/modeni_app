import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/padding.dart';
import '../../../../core/theme/sizedbox.dart';
import '../../../../core/theme/text_styles.dart';
import 'package:go_router/go_router.dart';

class MainQuestionCard extends StatelessWidget {
  const MainQuestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: AppPadding.all20Padding,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "당신에게 있어서 가족이란\n어떤 존재라고 생각하나요?",
            style: AppTextStyles.medium14,
            softWrap: true,
            maxLines: 3,
          ),
          AppSizedBox.h16SizedBox,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            onPressed: () => context.push("/answer_write"),
            child: Text("답변 하기", style: AppTextStyles.medium14.copyWith(color: AppColors.whiteColor)),
          ),
        ],
      ),
    );
  }
}