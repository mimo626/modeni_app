import 'package:flutter/material.dart';
import 'package:modeni_app/core/theme/text_styles.dart';
import 'package:modeni_app/features/mission/presentation/pages/mission_page.dart';
import 'package:modeni_app/features/questions_list/presentation/pages/question_list_page.dart';

import 'core/global/globals.dart';
import 'core/theme/colors.dart';
import 'features/diary/presentation/pages/diary_page.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/mypage/presentation/pages/my_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin{
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: Globals.navItems.length, vsync: this,);
    _tabController.addListener(tabListener);
  }

  @override
  void dispose() {
    _tabController.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    setState(() {
      _selectedIndex = _tabController.index;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _tabController.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: Globals.navItems.map((item) {
          return BottomNavigationBarItem(
              icon: item.icon,
              activeIcon: item.activeIcon,
              label: item.label
          );
        }).toList(),
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        onTap: _onItemTapped,
        backgroundColor: AppColors.whiteColor,
        selectedItemColor: AppColors.darkGreyColor,
        unselectedItemColor: AppColors.greyColor,
        selectedLabelStyle: AppTextStyles.semiBold13,
        unselectedLabelStyle: AppTextStyles.semiBold13,
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: const [
          HomePage(),
          QuestionListPage(),
          DiaryPage(),
          MissionPage(),
          MyPage(),
        ],
      ),
    );
  }
}