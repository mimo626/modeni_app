import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';
import 'nav_item.dart';

class Globals {
  // BottomNavigationBarItem의 아이콘 사이즈
  static double navItemSize = 24;

  // BottomNavigationBarItem들
  static List<NavItem> navItems = [
    NavItem(
      icon: Icon(
        Icons.home_outlined,
        color: AppColors.greyColor,
        size: Globals.navItemSize,
      ),
      activeIcon: Icon(
        Icons.home_outlined,
        color: AppColors.darkGreyColor,
        size: Globals.navItemSize,
      ),
      label: "홈",
    ),
    NavItem(
      icon: Icon(
        Icons.menu_outlined,
        color: AppColors.greyColor,
        size: Globals.navItemSize,
      ),
      activeIcon: Icon(
        Icons.menu_outlined,
        color: AppColors.darkGreyColor,
        size: Globals.navItemSize,
      ),
      label: "질문",
    ),
    NavItem(
      icon: Icon(
        Icons.library_books_outlined,
        color: AppColors.greyColor,
        size: Globals.navItemSize,
      ),
      activeIcon: Icon(
        Icons.library_books_outlined,
        color: AppColors.darkGreyColor,
        size: Globals.navItemSize,
      ),
      label: "일기장",
    ),
    NavItem(
      icon: Icon(
        Icons.add_box_outlined,
        color: AppColors.greyColor,
        size: Globals.navItemSize,
      ),
      activeIcon: Icon(
        Icons.add_box_outlined,
        color: AppColors.darkGreyColor,
        size: Globals.navItemSize,
      ),
      label: "미션",
    ),
    NavItem(
      icon: Icon(
        Icons.person_outline,
        color: AppColors.greyColor,
        size: Globals.navItemSize,
      ),
      activeIcon: Icon(
        Icons.person_outline,
        color: AppColors.darkGreyColor,
        size: Globals.navItemSize,
      ),
      label: "MY",
    ),
  ];

  static List<String> roleList = ["아빠", "엄마", "아들", "딸"];

  static List<String> regionList = [
    '서울특별시',
    '부산광역시',
    '대구광역시',
    '인천광역시',
    '광주광역시',
    '대전광역시',
    '울산광역시',
    '세종특별자치시',
    '경기도',
    '강원도',
    '충청북도',
    '충청남도',
    '전라북도',
    '전라남도',
    '경상북도',
    '경상남도',
    '제주특별자치도',
  ];

  static BigInt generateRandom8DigitBigInt() {
    final rand = Random();
    final randomNumber = 10000000 + rand.nextInt(90000000); // 10000000 ~ 99999999
    return BigInt.from(randomNumber);
  }

  static List<String> familyQuestions = [
    "우리 가족의 숨겨진 재능은 무엇이라고 생각하나요?",
    "스트레스를 풀 때 주로 무엇을 하나요?",
    "당신에게 있어서 가족이란 어떤 존재라고 생각하나요?",
    "가족들과 보낸 시간 중에 가장 행복했던 기억은 무엇인가요?",
    "가족들이 각각 닮은 동물과 그 이유는 무엇인가요?",
    "힘들거나 지칠 때 어떤 말이나 행동이 가장 큰 힘이 되나요?",
    "어린 시절 가장 기억에 남는 가족과의 추억은 무엇인가요?",
    "우리 가족이 함께 가보고 싶은 여행지가 있다면 어디인가요? 이유도 함께 말해주세요.",
    "가족끼리 하루 동안 아무 제약 없이 놀 수 있다면 무엇을 하고 싶나요?",
    "우리 가족 중, 오늘 가장 고마웠던 사람은 누구인가요?",
    "요즘 마음이 힘들 땐, 어떤 말이나 행동이 가장 위로가 되나요?",
  ];

  static List<String> emotions = [
    '행복', '평온', '감사', '뿌듯함', '여유',
    '사랑', '불안', '분노', '외로움', '슬픔', '답답함',
  ];

  static List<String> activities = [
    '휴식하기', '산책하기', '맛있는 거 먹기', '음악 듣기', '영화 보기', '책 읽기', '운동하기', '게임하기',
  ];

}