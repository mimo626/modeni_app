import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/padding.dart';
import '../../../../core/theme/sizedbox.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widget/primary_app_bar.dart';
import 'package:go_router/go_router.dart';

import '../widgets/familiy_list.dart';
import '../widgets/question_card.dart';


class QuestionDetailPage extends StatefulWidget {
  final int index;
  final String question;
  const QuestionDetailPage({super.key, required this.index, required this.question});

  @override
  State<QuestionDetailPage> createState() => _QuestionDetailPageState();
}

class _QuestionDetailPageState extends State<QuestionDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppbar(title: "질문", showNotificationIcon: true,),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        padding: AppPadding.h20Padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSizedBox.h24SizedBox,
            QuestionCard(index: widget.index, question: widget.question,),
            Padding(
              padding: AppPadding.h20v26Padding,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.tertiaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () => context.push("/answer_write"),
                  child: Text("작성하러 가기", style: AppTextStyles.medium14.copyWith(color: AppColors.whiteColor)),
                ),
              ),
            ),
            FamilyList(),
          ],
        ),
      ),
    );
  }
}


