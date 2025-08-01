import 'package:flutter/material.dart';
import 'package:modeni_app/core/global/globals.dart';
import 'package:modeni_app/core/theme/colors.dart';
import 'package:modeni_app/core/theme/padding.dart';
import 'package:modeni_app/core/widget/primary_app_bar.dart';

import '../../../home/data/datasources/question_datasource.dart';
import '../../data/model/question_model.dart';
import '../widgets/question_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionListPage extends StatefulWidget {
  const QuestionListPage({super.key});

  @override
  State<QuestionListPage> createState() => _QuestionListPageState();
}

class _QuestionListPageState extends State<QuestionListPage> {
  List<QuestionModel>? questionModels;
  String? familyCode;

  Future<void> _getFamilyQuestions(String familyCode) async {
    try {
      QuestionDatasource questionDatasource = QuestionDatasource();
      questionModels = await questionDatasource.getFamilyQuestions(familyCode);
    } catch (e) {
      logger.e("가족 질문들 가져오기 실패: $e");
    }
  }

  Future<void> _initialize() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      familyCode = prefs.getString('family_code');

      if (familyCode != null) {
        await _getFamilyQuestions(familyCode!);
      }
    } catch (e) {
      logger.e("초기화 실패: $e");
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    // initState에서 async 메서드를 안전하게 호출
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PrimaryAppbar(title: "질문리스트", showNotificationIcon: true),
      body: questionModels == null
          ? const Center(
        child: CircularProgressIndicator(color: AppColors.primaryColor),
      )
          : ListView.builder(
        itemCount: questionModels!.length,
        itemBuilder: (context, index) {
          final item = questionModels![index];
          return Padding(
            padding: AppPadding.h20Padding,
            child: QuestionWidget(index: index+1, questionModel: item),
          );
        },
      ),
    );
  }
}




