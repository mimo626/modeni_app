import 'package:flutter/material.dart';
import 'package:modeni_app/core/theme/padding.dart';
import 'package:modeni_app/core/theme/sizedbox.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../widgets/main_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSizedBox.h24SizedBox,
            Text("우리 가족의 4번째 질문", style: AppTextStyles.medium16),
            AppSizedBox.h16SizedBox,
            const QuestionCard(),
            AppSizedBox.h16SizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("lib/core/images/mainblue_smile.png", scale: 20,),
                Image.asset("lib/core/images/maingreen_zz.png", scale: 20,),
              ],
            ),
            AppSizedBox.h24SizedBox,
            const QuoteBanner(),
            AppSizedBox.h16SizedBox,
            const FamilyList(),
          ],
        ),
      ),
    );
  }
}

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: AppPadding.all20Padding,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "당신에게 있어서 가족이란\n어떤 존재라고 생각하나요?",
            style: AppTextStyles.medium14,
          ),
          AppSizedBox.h16SizedBox,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.tertiaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            onPressed: () {},
            child: Text("답변 하기", style: AppTextStyles.medium14.copyWith(color: AppColors.whiteColor)),
          ),
        ],
      ),
    );
  }
}

class QuoteBanner extends StatelessWidget {
  const QuoteBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child:  Text(
        "마음을 나누고, 시간을 함께",
        style: AppTextStyles.medium14,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class FamilyList extends StatelessWidget {
  const FamilyList({super.key});

  @override
  Widget build(BuildContext context) {
    final members = [
      FamilyMember(name: "나", nickname: "이채린", color: Colors.pinkAccent),
      FamilyMember(name: "아빠", nickname: "홍길동", color: Colors.lightBlue),
    ];

    return Column(
      children: members.map((member) => FamilyCard(member: member)).toList(),
    );
  }
}

class FamilyMember {
  final String name;
  final String nickname;
  final Color color;

  FamilyMember({required this.name, required this.nickname, required this.color});
}

class FamilyCard extends StatelessWidget {
  final FamilyMember member;

  const FamilyCard({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.primaryColor)
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: member.color,
            child: const Icon(Icons.face, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(member.name, style: AppTextStyles.semiBold14),
                Text(member.nickname, style: AppTextStyles.medium12),
              ],
            ),
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.whiteColor,
                  foregroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text("읽기 보러가기"),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text("마인드북 작성"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
