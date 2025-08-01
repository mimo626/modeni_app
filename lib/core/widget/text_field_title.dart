import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modeni_app/core/theme/padding.dart';

import '../theme/colors.dart';
import '../theme/sizedbox.dart';
import '../theme/text_styles.dart';

class TextFieldTitle extends StatefulWidget {
  final String? title; // 제목
  final TextEditingController controller; // 컨트롤러
  final bool isObscureText; // 비밀번호 입력 시 설정
  final String hintText; // 힌트 텍스트
  final ValueChanged<String>? onChanged; // 텍스트 필드 값 변경 시 호출되는 함수
  final bool enabled; // 텍스트 필드 활성화 여부
  final FocusNode? focusNode; // 포커스 노드
  final TextInputType? keyboardType; // 키보드 타입
  final List<TextInputFormatter>? inputFormatters; // 입력 형식 제한
  final int? minLines;
  const TextFieldTitle({
    super.key,
    this.title,
    required this.controller,
    this.isObscureText = false, // 기본값은 false
    required this.hintText,
    this.onChanged,
    this.enabled = true, // 기본값은 true
    this.focusNode,
    this.keyboardType,
    this.inputFormatters,
    this.minLines,
  });

  @override
  State<TextFieldTitle> createState() => _TextFieldTitleState();
}

class _TextFieldTitleState extends State<TextFieldTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 제목이 있을 경우만 표시
        if (widget.title != null)...[
          Text(
            widget.title!,
            style: AppTextStyles.medium14,
          ),
          AppSizedBox.h16SizedBox,
        ],

        TextField(
          minLines: widget.minLines,
          maxLines: null,
          controller: widget.controller,
          obscureText: widget.isObscureText,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: AppTextStyles.medium15.copyWith(
              color: AppColors.greyColor,
            ),
            filled: true, // 배경색 적용을 위함
            fillColor: AppColors.whiteColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.0),
              borderSide: BorderSide(color: AppColors.greyColor), // 비활성 상태
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.0),
              borderSide: BorderSide(color: AppColors.lightGreyColor), // 비활성 상태
            ),
          ),
          onChanged: widget.onChanged,
          enabled: widget.enabled,
        ),
      ],
    );
  }
}
