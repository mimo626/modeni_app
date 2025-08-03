import 'package:flutter/material.dart';
import 'package:modeni_app/core/theme/colors.dart';
import 'package:modeni_app/core/theme/padding.dart';
import 'package:modeni_app/core/theme/sizedbox.dart';
import 'package:modeni_app/core/theme/text_styles.dart';
import 'package:modeni_app/core/widget/primary_app_bar.dart';

class MissionPage extends StatelessWidget {
  const MissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PrimaryAppbar(title: "미션", showNotificationIcon: true,),
      body: SingleChildScrollView(
        padding: AppPadding.h20Padding,
        child: Column(
          children: [
            // 성향 카드
            Container(
              padding: AppPadding.all20Padding,
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Image.asset("lib/core/images/blue_rock.png", scale: 12,), // 또는 Image.asset('assets/blue.png')
                      ),
                      AppSizedBox.w12SizedBox,
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: '나는 ',
                            children: [
                              TextSpan(
                                text: '파랑이',
                                style: AppTextStyles.semiBold16.copyWith(color: AppColors.primaryColor)
                              ),
                              TextSpan(text: ' 성향입니다.'),
                            ],
                          ),
                          style: AppTextStyles.medium16
                        ),
                      )
                    ],
                  ),
                  AppSizedBox.h12SizedBox,
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text("성향 테스트 다시하기", style: AppTextStyles.semiBold14.copyWith(color: AppColors.whiteColor),),
                  )
                ],
              ),
            ),
            AppSizedBox.h20SizedBox,
            // 궁합
            Container(
              padding: AppPadding.all20Padding,
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("우리 가족과 궁합 알아보기",
                      style: AppTextStyles.medium16),
                  AppSizedBox.h12SizedBox,
                  Row(
                    children: [
                      Expanded(child: _FamilyCompatibilityCard(name: "아빠", type: "남색이")),
                      AppSizedBox.w12SizedBox,
                      Expanded(child: _FamilyCompatibilityCard(name: "엄마", type: "노랑이")),
                    ],
                  ),
                ],
              ),
            ),
            AppSizedBox.h20SizedBox,

            // 미션 카드
            Container(
              padding: AppPadding.all20Padding,
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 60,
                    height: 80,
                    child: Stack(
                      children: [
                        Positioned(left: 12, child: Card(child: SizedBox(width: 40, height: 60))),
                        Positioned(left: 0, child: Card(child: SizedBox(width: 40, height: 60))),
                      ],
                    ),
                  ),
                  AppSizedBox.w16SizedBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text("성공한 미션카드", style: AppTextStyles.medium16),
                        AppSizedBox.h4SizedBox,
                        Text("01개", style: AppTextStyles.semiBold16),
                        AppSizedBox.h4SizedBox,
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text("미션 카드 확인 하러가기", style: AppTextStyles.semiBold14.copyWith(color: AppColors.whiteColor),),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            AppSizedBox.h20SizedBox,

            // 복지 정보
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
                ),
                child: Row(
                  children: const [
                    Expanded(child: Text("우리 가족을 위한 복지 정보")),
                    Icon(Icons.arrow_forward_ios, size: 18),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _FamilyCompatibilityCard extends StatelessWidget {
  final String name;
  final String type;

  const _FamilyCompatibilityCard({required this.name, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: AppPadding.all16Padding,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green.shade100),
        borderRadius: BorderRadius.circular(16),
        color: AppColors.whiteColor
      ),
      child: Column(
        children: [
          Image.asset("lib/core/images/navy_rock.png", scale: 12,), // 또는 Image.asset('assets/blue.png')
          Text(name, style: AppTextStyles.semiBold14),
          const SizedBox(height: 4),
          Container(
            padding: AppPadding.h8v4Padding,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(type),
          ),
          AppSizedBox.h4SizedBox,
          Text("80%", style: AppTextStyles.medium14.copyWith(color: AppColors.greyColor)),
        ],
      ),
    );
  }
}
