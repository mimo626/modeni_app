import 'package:flutter/material.dart';
import 'package:modeni_app/core/theme/colors.dart';
import 'package:modeni_app/core/theme/padding.dart';
import 'package:modeni_app/core/theme/sizedbox.dart';
import 'package:modeni_app/core/widget/basic_btn.dart';
import 'package:go_router/go_router.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Image.asset(
                  "lib/core/images/modeni_logo.png",
                scale: 1.2,),
                SizedBox(height: 200,),
                Padding(
                  padding: AppPadding.h60Padding,
                  child: BasicBtn(btnText: "로그인 하기",
                      textColor: AppColors.primaryColor,
                      backgroundColor: AppColors.whiteColor,
                      onPressed: (){
                        context.push("/login");
                      }
                  ),
                ),
                AppSizedBox.h16SizedBox,
                Padding(
                  padding: AppPadding.h60Padding,
                  child: BasicBtn(btnText: "회원가입 하기",
                      textColor: AppColors.primaryColor,
                      backgroundColor: AppColors.whiteColor,
                      onPressed: (){
                        context.push("/signup_idpassword");
                      }
                  ),
                ),
              ],
            ),
          ),
          //AppSizedBox.h54SizedBox,
        ],
      ),
    );
  }
}
