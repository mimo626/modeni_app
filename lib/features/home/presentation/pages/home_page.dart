import 'package:flutter/material.dart';
import 'package:modeni_app/core/theme/padding.dart';
import 'package:modeni_app/core/theme/sizedbox.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../widgets/main_appbar.dart';

import '../widgets/main_question_card.dart';
import '../widgets/quote_banner.dart';

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
        padding: AppPadding.h20Padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSizedBox.h24SizedBox,
            Text("우리 가족의 4번째 질문", style: AppTextStyles.medium16),
            AppSizedBox.h16SizedBox,
            MainQuestionCard(),
            SizedBox(height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("lib/core/images/mainblue_smile.png", scale: 10,),
                Image.asset("lib/core/images/maingreen_zz.png", scale: 10,),
              ],
            ),
            AppSizedBox.h24SizedBox,
            const QuoteBanner(),
          ],
        ),
      ),
    );
  }
}




