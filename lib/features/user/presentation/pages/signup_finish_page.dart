import 'dart:async';

import 'package:flutter/material.dart';
import 'package:modeni_app/core/widget/primary_app_bar.dart';
import 'package:modeni_app/features/user/data/model/user_model.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/padding.dart';
import '../../../../core/theme/sizedbox.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widget/basic_btn.dart';
import 'package:go_router/go_router.dart';

import '../../../../main.dart';
import '../../data/datasources/user_datasource.dart';

class SignupFinishPage extends StatefulWidget {
  const SignupFinishPage({super.key});

  @override
  State<SignupFinishPage> createState() => _SignupFinishPageState();
}

class _SignupFinishPageState extends State<SignupFinishPage> {
  bool _showFirst = true;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _showFirst = !_showFirst;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  Future<void> _signUpUser(UserModel userModel) async{
    try {
      UserDatasource userDatasource = UserDatasource();
      await userDatasource.userSignUp(userModel);
    } catch (e) {
      logger.e("회원가입 실패: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PrimaryAppbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: AppPadding.h20Padding,
            child: LinearProgressIndicator(
              value: 1,
              backgroundColor: AppColors.lightGreyColor,
              color: AppColors.primaryColor,
            ),
          ),
          Spacer(),
          Text("회원가입 완료!\n모드니에 오신 걸 환영합니다.",
              textAlign: TextAlign.center,
              style: AppTextStyles.semiBold18.copyWith(color: AppColors.primaryColor)),
          AppSizedBox.h54SizedBox,
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _showFirst
                ? Image.asset(
              "lib/core/images/maingreen_smile.png",
              scale: 10,
              key: const ValueKey(1),
            )
                : Image.asset(
              "lib/core/images/maingreen_zz.png",
              scale: 10,
              key: const ValueKey(2),
            ),
          ),
          Spacer(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: AppPadding.v16Padding,
        child: BasicBtn(
          btnText: "시작하기",
          textColor: AppColors.whiteColor,
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            print(user_controller.user_id.value);
            print(user_controller.password.value);
            print(user_controller.name.value);
            print(user_controller.role.value);
            print(user_controller.region.value);
            print(user_controller.family_code.value);
            //서버에 유저 모델 저장
            final user = user_controller.user;
            _signUpUser(user);
            context.push("/login");
          },
        ),
      ),
    );
  }
}