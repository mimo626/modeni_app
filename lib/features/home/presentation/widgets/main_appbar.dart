import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      title: Image.asset("lib/core/images/modeni_logo_green.png", height: 24), // 모둔이 로고
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none, color: AppColors.greyColor),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
