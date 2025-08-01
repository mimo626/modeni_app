import 'package:flutter/material.dart';
import 'package:modeni_app/core/global/globals.dart';
import 'package:modeni_app/core/theme/colors.dart';
import 'package:modeni_app/core/theme/padding.dart';
import 'package:modeni_app/core/widget/primary_app_bar.dart';

import '../widgets/question_widget.dart';

class QuestionListPage extends StatefulWidget {
  const QuestionListPage({super.key});

  @override
  State<QuestionListPage> createState() => _QuestionListPageState();
}

class _QuestionListPageState extends State<QuestionListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PrimaryAppbar(title: "질문리스트", showNotificationIcon: true,),
      body: ListView.builder(
        itemCount: Globals.familyQuestions.length,
        itemBuilder: (context, index) {
          final item = Globals.familyQuestions[index];
          return Padding(
            padding: AppPadding.h20Padding,
            child: QuestionWidget(index: index+1, question: item)
          );
        },
      )
    );
  }
}



