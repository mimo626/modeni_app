import 'package:flutter/material.dart';
import 'package:modeni_app/core/theme/colors.dart';
import 'package:modeni_app/core/theme/sizedbox.dart';
import 'package:modeni_app/core/theme/text_styles.dart';

class RoleBtn extends StatefulWidget {
  final String role;
  final bool isSelected;
  const RoleBtn({super.key, required this.role, required this.isSelected});

  @override
  State<RoleBtn> createState() => _RoleBtnState();
}

class _RoleBtnState extends State<RoleBtn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
            widget.isSelected ? "lib/core/images/son_profile.png"
                : "lib/core/images/grey_profile.png",
          scale: 6,
        ),
        AppSizedBox.h16SizedBox,
        Text(widget.role, style: AppTextStyles.semiBold14.copyWith(
            color: widget.isSelected? AppColors.darkGreyColor : AppColors.greyColor
        ),)
      ],
    );
  }
}
