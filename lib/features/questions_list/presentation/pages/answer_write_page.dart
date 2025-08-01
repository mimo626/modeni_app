import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/padding.dart';
import '../../../../core/theme/sizedbox.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widget/basic_btn.dart';
import '../../../../core/widget/primary_app_bar.dart';
import '../../../../core/widget/text_field_title.dart';
import '../widgets/question_card.dart';
import 'package:go_router/go_router.dart';

class AnswerWritePage extends StatefulWidget {
  const AnswerWritePage({super.key});

  @override
  State<AnswerWritePage> createState() => _AnswerWritePageState();
}

class _AnswerWritePageState extends State<AnswerWritePage> {
  final TextEditingController answerController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    answerController.addListener(_onNameChanged);
  }

  void _onNameChanged() {
    setState(() {
      isButtonEnabled = answerController.text.trim().isNotEmpty;
    });
  }

  @override
  void dispose() {
    answerController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppbar(title: "답변 입력",
        leadingButtonIcon: "lib/core/icons/x.svg",
        leadingButtonPressed: () => context.pop(),
      ),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        padding: AppPadding.h20Padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSizedBox.h24SizedBox,
            QuestionCard(index: 1, question: "fjdkfalsd",),
            AppSizedBox.h24SizedBox,
            TextFieldTitle(
              minLines: 6,
              controller: answerController,
              hintText: "최대 50자 이내 입력",
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: AppPadding.v16Padding,
        child: BasicBtn(
          btnText: "입력 완료",
          textColor: AppColors.whiteColor,
          backgroundColor: isButtonEnabled
              ? AppColors.primaryColor
              : AppColors.lightGreyColor,
          onPressed: () {
            if (isButtonEnabled) {
              setState(() {
                // 유저 정보 저장
                context.pop();
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
