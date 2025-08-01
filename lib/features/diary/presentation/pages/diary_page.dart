import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modeni_app/core/theme/padding.dart';
import 'package:modeni_app/core/theme/sizedbox.dart';
import 'package:modeni_app/core/theme/text_styles.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/widget/basic_btn.dart';
import '../../../../core/widget/primary_app_bar.dart';

class DiaryPage extends StatelessWidget {
  const DiaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PrimaryAppbar(title: "일기", showNotificationIcon: true,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: AppPadding.h20v26Padding,
            child: SizedBox(
              width: double.infinity,
              child: BasicBtn(btnText: "작성하기", textColor: AppColors.whiteColor,
                backgroundColor: AppColors.tertiaryColor,
                onPressed: () => context.push("/diary_write"),
              ),
            ),
          ),
          // 가족 구성원들
          const Divider(),
          const DiaryItemRow(name: "아빠", emotions: ["뿌듯함", "행복",], activities: ["산책하기", "요리하기"], content: ""),
          AppSizedBox.h16SizedBox,
          const Divider(),
          const DiaryItemRow(name: "엄마", emotions: ["뿌듯함", "행복"], activities: ["산책하기", "요리하기"], content: "재밌는 하루였습니당"),
        ],
      ),
    );
  }
}

class DiaryItemRow extends StatelessWidget {
  final String name;
  final List<String> emotions;
  final List<String> activities;
  final String content;

  const DiaryItemRow({super.key,
    required this.name,
    required this.emotions,
    required this.activities,
    required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.h20Padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSizedBox.h24SizedBox,
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          AppSizedBox.h8SizedBox,
          Wrap(
            spacing: 8,
            children: emotions.map((emotion) => _KeywordChip(tag: emotion, bgColor: AppColors.secondaryColor,)).toList(),
          ),
          AppSizedBox.h12SizedBox,
          Wrap(
            spacing: 8,
            children: activities.map((activity) => _KeywordChip(tag: activity, bgColor: AppColors.orangeColor,)).toList(),
          ),
          AppSizedBox.h12SizedBox,

          content.trim().isEmpty ? SizedBox() :
          Text(content, style: AppTextStyles.medium14.copyWith(color: AppColors.darkGreyColor)),
          AppSizedBox.h16SizedBox,
        ],
      ),
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
