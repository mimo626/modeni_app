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
}