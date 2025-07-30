import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/widget/primary_app_bar.dart';
import '../widgets/my_list_widget.dart';
import '../widgets/my_profile_widget.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PrimaryAppbar(
        title: "마이페이지",
        showNotificationIcon: true,
        showSettingIcon: true,
      ),
      body: Column(
        children: [
          MyProfileWidget(),
          Divider(
            color: AppColors.lightGreyColor,
            thickness: 10,
          ),
          MyListWidget(title: "공지사항", onTap: () {}),
          MyListWidget(title: "문의하기", onTap: () {}),
          MyListWidget(title: "자주 묻는 질문", onTap: () {}),
          MyListWidget(title: "오픈소스 라이선스", onTap: () {}),
          MyListWidget(title: "버전 정보", onTap: () {}),
          MyListWidget(title: "로그아웃", onTap: () {}, color: AppColors.greyColor,),
        ],
      ),
    );
  }
}
