import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/padding.dart';
import '../../../../core/theme/sizedbox.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widget/primary_app_bar.dart';

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
                  onPressed: () {},
                  child: Text("작성하러 가기", style: AppTextStyles.medium14.copyWith(color: AppColors.whiteColor)),
                ),
              ),
            ),
            const FamilyList(),
          ],
        ),
      ),
    );
  }
}

class QuestionCard extends StatelessWidget {
  final int index;
  final String question;
  const QuestionCard({super.key, required this.index, required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: AppPadding.all40Padding,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "${index.toString().padLeft(3, '0')}",
            style: AppTextStyles.semiBold16.copyWith(color: AppColors.primaryColor),),
          AppSizedBox.w16SizedBox,
          Expanded(
            child: Text(
              question,
              style: AppTextStyles.medium14,
              softWrap: true, 
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}

class FamilyList extends StatelessWidget {
  const FamilyList({super.key});

  @override
  Widget build(BuildContext context) {
    final members = [
      FamilyMember(name: "엄마", answer: "없어서는 안될 존재없어서는 안될 존재없어서는 안될 존재없어서는 안될 존재없어서는 안될 존재", imgUrl: "lib/core/images/dau_profile.png", heartCount: 3),
      FamilyMember(name: "아빠", answer: "없어서는 안될 존재", imgUrl: "lib/core/images/dad_profile.png", heartCount: 1),
    ];

    return Column(
      children: members.map((member) => FamilyCard(member: member)).toList(),
    );
  }
}

class FamilyMember {
  final String name;
  final String answer;
  final String imgUrl;
  final int heartCount;

  FamilyMember({required this.name, required this.answer, required this.imgUrl, required this.heartCount, });
}

class FamilyCard extends StatelessWidget {
  final FamilyMember member;

  const FamilyCard({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.bottom12Padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: AppPadding.all20Padding,
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.primaryColor)
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(member.imgUrl, scale: 6,),
                        AppSizedBox.h4SizedBox,
                        Text(member.name, style: AppTextStyles.medium14),
                      ],
                    ),
                    AppSizedBox.w16SizedBox,
                    Expanded(
                      child: Text(member.answer, style: AppTextStyles.medium14,
                        softWrap: true,
                        overflow: TextOverflow.visible,),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: AppColors.primaryColor,
                foregroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: Text("👍️ ${member.heartCount}", style: AppTextStyles.medium16.copyWith(color: AppColors.whiteColor),),
            ),
          ),
        ],
      ),
    );
  }
}
