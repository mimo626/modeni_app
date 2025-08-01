import 'package:flutter/material.dart';
import 'package:modeni_app/core/global/globals.dart';
import 'package:modeni_app/core/theme/colors.dart';
import 'package:modeni_app/core/theme/sizedbox.dart';
import 'package:modeni_app/core/theme/text_styles.dart';
import 'package:modeni_app/core/widget/text_field_title.dart';

import '../../../../core/theme/padding.dart';
import '../../../../core/widget/basic_btn.dart';
import '../../../../core/widget/primary_app_bar.dart';
import 'package:go_router/go_router.dart';

class DiaryWritePage extends StatefulWidget {
  const DiaryWritePage({super.key});

  @override
  State<DiaryWritePage> createState() => _DiaryWritePageState();
}

class _DiaryWritePageState extends State<DiaryWritePage> {
  final TextEditingController _controller = TextEditingController();
  bool isButtonEnabled = false;

  Set<String> selectedEmotions = {};
  Set<String> selectedTodos = {};

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateButtonState);
  }

  // 변경: 감정 선택 함수
  void _toggleEmotion(String emotion) {
    setState(() {
      if (selectedEmotions.contains(emotion)) {
        selectedEmotions.remove(emotion);
      } else if (selectedEmotions.length < 3) {
        selectedEmotions.add(emotion);
      }
      _updateButtonState();
    });
  }

// 변경: 할 일 선택 함수
  void _toggleTodo(String todo) {
    setState(() {
      if (selectedTodos.contains(todo)) {
        selectedTodos.remove(todo);
      } else if (selectedTodos.length < 3) {
        selectedTodos.add(todo);
      }
      _updateButtonState();
    });
  }

// 추가: 버튼 상태 업데이트 함수
  void _updateButtonState() {
    isButtonEnabled = selectedEmotions.length > 0 &&
        selectedTodos.length > 0 &&
        selectedEmotions.length <= 3 &&
        selectedTodos.length <= 3;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PrimaryAppbar(title: "일기 작성",
        leadingButtonIcon: "lib/core/icons/x.svg",
        leadingButtonPressed: () => context.pop(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("오늘 어떤 감정을 느꼈나요?", style: AppTextStyles.semiBold16),
              AppSizedBox.h4SizedBox,
              Text("최대 3개 선택 가능", style: AppTextStyles.medium12.copyWith(color: AppColors.greyColor)),
              AppSizedBox.h8SizedBox,
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: Globals.emotions.map((e) {
                  final isSelected = selectedEmotions.contains(e);
                  return ChoiceChip(
                    label: Text(e),
                    showCheckmark: false,
                    backgroundColor: AppColors.lightGreyColor,
                    selected: isSelected,
                    selectedColor: AppColors.secondaryColor,
                    onSelected: (_) => _toggleEmotion(e),
                    shape: StadiumBorder(side: BorderSide(color: isSelected ?AppColors.secondaryColor : AppColors.lightGreyColor)),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              Text("오늘 어떤 걸 하고싶으신가요?", style: AppTextStyles.semiBold16),
              AppSizedBox.h4SizedBox,
              Text("최대 3개 선택 가능", style: AppTextStyles.medium12.copyWith(color: AppColors.greyColor)),
              AppSizedBox.h8SizedBox,
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: Globals.activities.map((t) {
                  final isSelected = selectedTodos.contains(t);
                  return ChoiceChip(
                    label: Text(t),
                    showCheckmark: false,
                    backgroundColor: AppColors.lightGreyColor,
                    selected: isSelected,
                    selectedColor: AppColors.orangeColor,
                    onSelected: (_) => _toggleTodo(t),
                    shape: StadiumBorder(side: BorderSide(color: isSelected ? AppColors.orangeColor : AppColors.lightGreyColor)),
                  );
                }).toList(),
              ),
              AppSizedBox.h24SizedBox,
              Text("오늘 나만의 이야기", style: AppTextStyles.semiBold16),
              AppSizedBox.h8SizedBox,
              TextFieldTitle(controller: _controller,
                  hintText: "최대 50자 이내 입력",
                  minLines: 5,
              ),
              AppSizedBox.h24SizedBox,
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: AppPadding.v16Padding,
        child: BasicBtn(
          btnText: "입력 완료",
          textColor: AppColors.whiteColor,
          backgroundColor: isButtonEnabled
              ? AppColors.primaryColor
              : AppColors.lightGreyColor,
          onPressed: () {
            if (isButtonEnabled) {
              setState(() {
                // 유저 정보 저장
                context.pop();
              });
            }
            else {
              null;
            }
          },
        ),
      ),
    );
  }
}
