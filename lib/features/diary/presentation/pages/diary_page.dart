import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modeni_app/core/global/globals.dart';
import 'package:modeni_app/core/theme/padding.dart';
import 'package:modeni_app/core/theme/sizedbox.dart';
import 'package:modeni_app/core/theme/text_styles.dart';
import 'package:modeni_app/core/theme/theme.dart';
import 'package:modeni_app/core/widget/list_view_widget.dart';

import '../../../../core/widget/basic_btn.dart';
import '../../../../core/widget/primary_app_bar.dart';

class FamilyAnswerModel {
  final String name;
  final List<String> emotions;
  final List<String> activities;
  final String content;

  FamilyAnswerModel({
    required this.name,
    required this.emotions,
    required this.activities,
    required this.content,
  });
}


class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      appBar: PrimaryAppbar(title: "일기장", showNotificationIcon: true,),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Globals.familyAnswers.length == 4 ? SizedBox() :
            Padding(
              padding: AppPadding.h20v26Padding,
              child: SizedBox(
                width: double.infinity,
                child: BasicBtn(btnText: "작성하기", textColor: context.colorScheme.onTertiary,
                  backgroundColor: context.colorScheme.tertiary,
                    onPressed: () async {
                      await context.push("/diary_write");
                      setState(() {}); // 돌아왔을 때 화면 갱신
                    },
                ),
              ),
            ),
            // 가족 구성원들
            ListViewWidget(list: Globals.familyAnswers, listLength: Globals.familyAnswers.length,
                listWidgetBuilder: (item) => DiaryItemRow(familyAnswerModel: item),),
            AppSizedBox.h16SizedBox,
            Divider(color: context.colorScheme.outlineVariant,),
          ],
        ),
      ),
    );
  }
}

class DiaryItemRow extends StatelessWidget {
  final FamilyAnswerModel familyAnswerModel;

  const DiaryItemRow({super.key,
    required this.familyAnswerModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSizedBox.h16SizedBox,
        Divider(color: context.colorScheme.outlineVariant,),
        Padding(
          padding: AppPadding.h20Padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSizedBox.h24SizedBox,
              Text(familyAnswerModel.name, style: TextStyle(fontWeight: FontWeight.bold, color: context.colorScheme.onSecondary)),
              AppSizedBox.h8SizedBox,
              Wrap(
                spacing: 8,
                children: familyAnswerModel.emotions.map((emotion) => _KeywordChip(tag: emotion, bgColor: context.colorScheme.secondary,)).toList(),
              ),
              AppSizedBox.h12SizedBox,
              Wrap(
                spacing: 8,
                children: familyAnswerModel.activities.map((activity) => _KeywordChip(tag: activity, bgColor: context.colorScheme.secondary,)).toList(),
              ),
              AppSizedBox.h12SizedBox,

              familyAnswerModel.content.trim().isEmpty ? SizedBox() :
              Text(familyAnswerModel.content, style: AppTextStyles.medium14.copyWith(color: context.colorScheme.onSecondary)),
              AppSizedBox.h16SizedBox,
            ],
          ),
        ),
      ],
    );
  }
}

class _KeywordChip extends StatelessWidget {
  final String tag;
  final Color bgColor;

  const _KeywordChip({required this.tag, required this.bgColor});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(tag),
    );
  }
}
