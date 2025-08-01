import 'dart:async';

import 'package:flutter/material.dart';
import 'package:modeni_app/core/theme/padding.dart';
import 'package:modeni_app/core/theme/sizedbox.dart';
import 'package:modeni_app/features/home/data/datasources/question_datasource.dart';
import 'package:modeni_app/features/questions_list/data/model/question_model.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../widgets/main_appbar.dart';

import '../widgets/main_question_card.dart';
import '../widgets/quote_banner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showFirst = true;
  late Timer _timer;
  QuestionModel? questionModel;
  late final String? familyCode;

  Future<void> _getTodayQuestion(String familyCode) async{
    try {
      QuestionDatasource questionDatasource = QuestionDatasource();
      questionModel = await questionDatasource.getTodayQuestion(familyCode);
    } catch (e) {
      logger.e("오늘의 질문 가져오기 실패: $e");
    }
  }

  Future<void> _saveFamilyCode() async{
    try {
      final prefs = await SharedPreferences.getInstance();
      familyCode = prefs.getString('family_code')!;
    } catch (e) {
      logger.e("가족코드 가져오기 실패: $e");
    }
  }

  Future<void> _initialize() async {
    await _saveFamilyCode();

    if (familyCode != null) {
      await _getTodayQuestion(familyCode!);
      setState(() {}); // questionModel이 초기화된 후 UI 업데이트
    }
  }

  @override
  void initState() {
    _initialize();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _showFirst = !_showFirst;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      backgroundColor: AppColors.whiteColor,
      body: questionModel == null ? Center(
        child: CircularProgressIndicator(color: AppColors.primaryColor,),
      ) :
      SingleChildScrollView(
        padding: AppPadding.h20Padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSizedBox.h24SizedBox,
            Text("우리 가족의 ${questionModel!.id}번째 질문", style: AppTextStyles.medium16),
            AppSizedBox.h16SizedBox,
            MainQuestionCard(questionModel: questionModel!),
            SizedBox(height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("lib/core/images/mainblue_smile.png", scale: 10,),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _showFirst
                      ? Image.asset(
                    "lib/core/images/maingreen_smile.png",
                    scale: 10,
                    key: const ValueKey(1),
                  )
                      : Image.asset(
                    "lib/core/images/maingreen_zz.png",
                    scale: 10,
                    key: const ValueKey(2),
                  ),
                ),
              ],
            ),
            AppSizedBox.h24SizedBox,
            const QuoteBanner(),
          ],
        ),
      ),
    );
  }
}




