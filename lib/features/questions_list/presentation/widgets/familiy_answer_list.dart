import 'package:flutter/material.dart';
import 'package:modeni_app/core/global/globals.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/padding.dart';
import '../../../../core/theme/sizedbox.dart';
import '../../../../core/theme/text_styles.dart';


class Member {
  final String role; // 엄마, 아빠, 아들, 딸
  final String answer;
  int heartCount;
  Set<String> likedUserIds; // 누가 좋아요 눌렀는지 저장

  Member({
    required this.role,
    required this.answer,
    required this.heartCount,
    required this.likedUserIds,
  });
}

class FamilyAnswerList extends StatefulWidget {
  final Member? member;
  const FamilyAnswerList(this.member, {super.key,});

  @override
  State<FamilyAnswerList> createState() => _FamilyAnswerListState();
}

class _FamilyAnswerListState extends State<FamilyAnswerList> {
  final currentUserId = 'user123'; // 예시 사용자 ID


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.member != null) {
      Globals.members.add(widget.member!);
    }
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      children: Globals.members
          .map((member) => FamilyAnswerCard(
        member: member,
        currentUserId: currentUserId,
      ))
          .toList(),
    );
  }
}


class FamilyAnswerCard extends StatefulWidget {
  final Member member;
  final String currentUserId; // 현재 로그인한 유저 ID

  const FamilyAnswerCard({super.key, required this.member, required this.currentUserId,});

  @override
  State<FamilyAnswerCard> createState() => _FamilyAnswerCardState();
}

class _FamilyAnswerCardState extends State<FamilyAnswerCard> {
  String _getProfileImage(String role) {
    switch (role) {
      case '엄마':
        return 'lib/core/images/mom_profile.png';
      case '아빠':
        return 'lib/core/images/dad_profile.png';
      case '아들':
        return 'lib/core/images/son_profile.png';
      case '딸':
        return 'lib/core/images/dau_profile.png';
      default:
        return 'lib/core/images/default_profile.png';
    }
  }

  void _toggleLike() {
    final userId = widget.currentUserId;

    setState(() {
      if (widget.member.likedUserIds.contains(userId)) {
        // 이미 눌렀으면 취소
        widget.member.likedUserIds.remove(userId);
        widget.member.heartCount--;
      } else {
        // 안 눌렀으면 추가
        widget.member.likedUserIds.add(userId);
        widget.member.heartCount++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final member = widget.member;
    final profileImage = _getProfileImage(member.role);
    final isLiked = member.likedUserIds.contains(widget.currentUserId);

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
                        Image.asset(profileImage, width: 60, height: 60), // 프로필 이미지
                        AppSizedBox.h4SizedBox,
                        Text(member.role, style: AppTextStyles.medium14),
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
            onTap: _toggleLike,
            child: ElevatedButton(
              onPressed: _toggleLike,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: isLiked ? AppColors.primaryColor : AppColors.greyColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                "👍️ ${member.heartCount}",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
