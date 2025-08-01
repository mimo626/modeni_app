import 'package:flutter/material.dart';
import 'package:modeni_app/core/global/globals.dart';
import 'package:modeni_app/features/home/data/datasources/question_datasource.dart';
import 'package:modeni_app/features/questions_list/data/model/answer_model.dart';
import 'package:modeni_app/features/questions_list/data/model/question_model.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/padding.dart';
import '../../../../core/theme/sizedbox.dart';
import '../../../../core/widget/basic_btn.dart';
import '../../../../core/widget/primary_app_bar.dart';
import '../../../../core/widget/text_field_title.dart';
import '../widgets/familiy_answer_list.dart';
import '../widgets/question_card.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnswerWritePage extends StatefulWidget {
  final QuestionModel questionModel;
  const AnswerWritePage({super.key, required this.questionModel});

  @override
  State<AnswerWritePage> createState() => _AnswerWritePageState();
}

class _AnswerWritePageState extends State<AnswerWritePage> {
  final TextEditingController answerController = TextEditingController();
  bool isButtonEnabled = false;
  AnswerModel? answerModel;
  int? id;

  @override
  void initState() {
    super.initState();
    _saveId();
    answerController.addListener(_onNameChanged);
  }

  void _onNameChanged() {
    setState(() {
      isButtonEnabled = answerController.text.trim().isNotEmpty;
    });
  }

  Future<void> _saveId() async{
    try {
      final prefs = await SharedPreferences.getInstance();
      id = prefs.getInt('id')!;
    } catch (e) {
      logger.e("유저 id 가져오기 실패: $e");
    }
  }

  Future<void> _createAnswer(int questionId, int userId, String content) async {
    try {
      QuestionDatasource questionDatasource = QuestionDatasource();
      answerModel = await questionDatasource.createAnswer(questionId, userId, content);

      logger.i("대답 저장 성공");
    } catch (e) {
      logger.e("대답 저장 실패: $e");
      // 로그인 실패 시 에러 메시지 출력 등 처리 가능
    }
  }

  Future<void> _save() async{
    try {

    } catch (e) {
      logger.e("가족코드 가져오기 실패: $e");
    }
  }

  @override
  void dispose() {
    answerController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppbar(title: "답변 작성",
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
            QuestionCard(index: widget.questionModel.id, question: widget.questionModel.content,),
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
          onPressed: isButtonEnabled
              ? () async {
            final member = Member(
              role: "딸",
              answer: "든든한 버팀목이에요",
              heartCount: 0,
              likedUserIds: {'user123'},
            );
            Globals.members.insert(0, member);
            context.pop(answerModel);
          }
          : () {null;},
        ),
      ),
    );
  }
}
