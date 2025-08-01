import 'package:flutter/material.dart';
import 'package:modeni_app/features/questions_list/data/model/question_model.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/padding.dart';
import '../../../../core/theme/sizedbox.dart';
import '../../../../core/theme/text_styles.dart';
import 'package:go_router/go_router.dart';

class MainQuestionCard extends StatelessWidget {
  final QuestionModel questionModel;
  const MainQuestionCard({super.key, required this.questionModel});

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
            questionModel.content,
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
            onPressed: () => context.push("/answer_write", extra: {"questionModel": questionModel}),
            child: Text("답변 하기", style: AppTextStyles.medium14.copyWith(color: AppColors.whiteColor)),
          ),
        ],
      ),
    );
  }
}