import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modeni_app/features/questions_list/data/model/question_model.dart';

import '../../features/diary/presentation/pages/diary_page.dart';
import '../../features/questions_list/presentation/widgets/familiy_answer_list.dart';
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

  static String generateRandom8DigitBigInt() {
    final rand = Random();
    final randomNumber = 10000000 + rand.nextInt(90000000); // 10000000 ~ 99999999
    return "${BigInt.from(randomNumber)}";
  }

  static List<QuestionModel> familyQuestions = [
    QuestionModel(
      id: 1,
      content: "오늘은 가족과 함께 산책을 했어요. 행복했어요.",
      familyCode: "494949",
    ),
    QuestionModel(
      id: 2,
      content: "비가 와서 우울했지만, 엄마가 만든 김치찌개가 맛있었어요.",
      familyCode: "494949",
    ),
    QuestionModel(
      id: 3,
      content: "동생이랑 싸웠지만 금방 화해했어요.",
      familyCode: "494949",
    ),
    QuestionModel(
      id: 4,
      content: "오늘은 새로운 책을 읽었어요. 생각이 많아졌어요.",
      familyCode: "494949",
    ),
  ];


  static List<String> emotions = [
    '행복', '평온', '감사', '뿌듯함', '여유',
    '사랑', '불안', '분노', '외로움', '슬픔', '답답함',
  ];

  static List<String> activities = [
    '휴식하기', '산책하기', '맛있는 거 먹기', '음악 듣기', '영화 보기', '책 읽기', '운동하기', '게임하기',
  ];

  static List<FamilyAnswerModel> familyAnswers = [
    FamilyAnswerModel(
      name: "아빠",
      emotions: ["뿌듯함", "행복"],
      activities: ["산책하기", "요리하기"],
      content: "산책하고 요리해서 좋았다.",
    ),
    FamilyAnswerModel(
      name: "엄마",
      emotions: ["감사함", "기쁨"],
      activities: ["책 읽기", "요가하기"],
      content: "고요하게 책을 읽은 하루",
    ),
    FamilyAnswerModel(
      name: "형",
      emotions: ["짜증", "피곤"],
      activities: ["게임하기", "운동하기"],
      content: "게임을 많이 져서 짜증나고 피곤하다",
    ),
  ];

  static List<Member> members = [
    Member(
      role: "엄마",
      answer: "없어서는 안될 존재없어서는 안될 존재에요!",
      heartCount: 3,
      likedUserIds: {'user456', 'user789'},
    ),
    Member(
      role: "아빠",
      answer: "안정적인 울타리이자 나의 사랑이죠.",
      heartCount: 1,
      likedUserIds: {'user123'},
    ),
    Member(
      role: "아들",
      answer: "행복하고 편안한 존재에요.",
      heartCount: 3,
      likedUserIds: {'user456', 'user789'},
    ),
  ];

}