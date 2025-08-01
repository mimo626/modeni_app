import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/padding.dart';
import '../../../../core/theme/sizedbox.dart';
import '../../../../core/theme/text_styles.dart';

class QuestionCard extends StatelessWidget {
  final int index;
  final String question;
  const QuestionCard({super.key, required this.index, required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: AppPadding.all40Padding,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "${index.toString().padLeft(3, '0')}",
            style: AppTextStyles.semiBold16.copyWith(color: AppColors.primaryColor),),
          AppSizedBox.w16SizedBox,
          Expanded(
            child: Text(
              question,
              style: AppTextStyles.medium14,
              softWrap: true,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}