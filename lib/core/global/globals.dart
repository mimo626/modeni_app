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
}