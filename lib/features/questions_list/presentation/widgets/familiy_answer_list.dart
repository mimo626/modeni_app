import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/padding.dart';
import '../../../../core/theme/sizedbox.dart';
import '../../../../core/theme/text_styles.dart';

class FamilyMember {
  final String name;
  final String answer;
  final String imgUrl;
  final int heartCount;

  FamilyMember({required this.name, required this.answer, required this.imgUrl, required this.heartCount, });
}

class FamilyAnswerList extends StatelessWidget {
  const FamilyAnswerList({super.key});

  @override
  Widget build(BuildContext context) {
    final members = [
      FamilyMember(name: "엄마", answer: "없어서는 안될 존재없어서는 안될 존재없어서는 안될 존재없어서는 안될 존재없어서는 안될 존재", imgUrl: "lib/core/images/dau_profile.png", heartCount: 3),
      FamilyMember(name: "아빠", answer: "없어서는 안될 존재", imgUrl: "lib/core/images/dad_profile.png", heartCount: 1),
    ];

    return Column(
      children: members.map((member) => FamilyAnswerCard(member: member)).toList(),
    );
  }
}

class FamilyAnswerCard extends StatelessWidget {
  final FamilyMember member;

  const FamilyAnswerCard({super.key, required this.member});

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
