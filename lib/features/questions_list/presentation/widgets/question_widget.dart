import 'package:flutter/material.dart';
import 'package:modeni_app/features/questions_list/data/model/question_model.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/sizedbox.dart';
import '../../../../core/theme/text_styles.dart';
import 'package:go_router/go_router.dart';

class QuestionWidget extends StatefulWidget {
  final int index;
  final QuestionModel questionModel;
  const QuestionWidget({super.key, required this.questionModel, required this.index});

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
          onTap: () => context.push("/question_detail", extra: {"index": widget.index, "questionModel": widget.questionModel}),
          child: Row(
            children: [
              Text(
                "${(widget.index).toString().padLeft(3, '0')}",
                style: AppTextStyles.semiBold16.copyWith(color: AppColors.primaryColor),),
              AppSizedBox.w18SizedBox,
              Expanded(
                child: Text("${widget.questionModel.content}", style: AppTextStyles.medium14.copyWith(color: AppColors.darkGreyColor),
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