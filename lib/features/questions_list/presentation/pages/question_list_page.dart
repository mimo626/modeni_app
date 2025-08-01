import 'package:flutter/material.dart';
import 'package:modeni_app/core/global/globals.dart';
import 'package:modeni_app/core/theme/colors.dart';
import 'package:modeni_app/core/theme/padding.dart';
import 'package:modeni_app/core/theme/sizedbox.dart';
import 'package:modeni_app/core/theme/text_styles.dart';
import 'package:modeni_app/core/widget/list_view_widget.dart';
import 'package:modeni_app/core/widget/primary_app_bar.dart';
import 'package:go_router/go_router.dart';

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

class QuestionWidget extends StatefulWidget {
  final int index;
  final String question;
  const QuestionWidget({super.key, required this.index, required this.question});

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(widget.index == 1) AppSizedBox.h24SizedBox,
        InkWell(
          onTap: () => context.push("/question_detail", extra: {"index": widget.index, "question": widget.question}),
          child: Row(
            children: [
              Text(
                "${widget.index.toString().padLeft(3, '0')}",
                style: AppTextStyles.semiBold16.copyWith(color: AppColors.primaryColor),),
              AppSizedBox.w18SizedBox,
              Expanded(
                child: Text("${widget.question}", style: AppTextStyles.medium14.copyWith(color: AppColors.darkGreyColor),
                  softWrap: true,
                  maxLines: 3,
                ),
              ),
            ],
          ),
        ),
        AppSizedBox.h20SizedBox,
      ],
    );
  }
}

