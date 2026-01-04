import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modeni_app/core/theme/theme.dart';

class CustomLinearProgress extends StatelessWidget {
  final double value;
  const CustomLinearProgress({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      backgroundColor: context.colorScheme.secondary,
      color: context.colorScheme.primary,
    );
  }
}