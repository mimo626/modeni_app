import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/padding.dart';
import '../../../../core/theme/text_styles.dart';

class MyListWidget extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final Color color;
  const MyListWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.color = Colors.black,
  });

  @override
  State<MyListWidget> createState() => _MyListWidgetState();
}

class _MyListWidgetState extends State<MyListWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: AppPadding.h20v16Padding,
            child: Text(widget.title, style: AppTextStyles.medium14.copyWith(color: widget.color),),
          ),
          Divider(color: AppColors.lightGreyColor,)
        ],
      ),
    );
  }
}