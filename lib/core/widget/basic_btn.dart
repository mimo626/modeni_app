import 'package:flutter/material.dart';
import 'package:modeni_app/core/theme/colors.dart';

import '../theme/padding.dart';
import '../theme/text_styles.dart';


class BasicBtn extends StatefulWidget {
  final String btnText;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final Color? borderColor;

  const BasicBtn({
    super.key,
    required this.btnText,
    required this.textColor,
    required this.backgroundColor,
    required this.onPressed,
    this.padding = AppPadding.h20Padding,
    this.borderColor,
  });

  @override
  State<BasicBtn> createState() => _BasicBtnState();
}

class _BasicBtnState extends State<BasicBtn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:widget.padding,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          padding: AppPadding.v16Padding,
          minimumSize: Size(double.infinity, 56),
          backgroundColor: widget.backgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: widget.borderColor != null ? BorderSide(color: widget.borderColor!, width: 2)
                : BorderSide.none
          ),
        ),
        child: Text(
          widget.btnText,
          style: AppTextStyles.semiBold16.copyWith(color: widget.textColor),
        ),
      ),
    );
  }
}