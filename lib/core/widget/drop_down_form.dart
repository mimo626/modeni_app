import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/colors.dart';

class DropDownForm extends StatefulWidget {
  final List<String> list;
  final Function(String) onChange;
  const DropDownForm({super.key, required this.list, required this.onChange});

  @override
  State<DropDownForm> createState() => _DropDownFormState();
}

class _DropDownFormState extends State<DropDownForm> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.list.first;
    widget.onChange(selectedValue!);
  }


  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      dropdownColor: AppColors.whiteColor,
      icon: SvgPicture.asset("lib/core/icons/arrow_down.svg"),
      decoration: const InputDecoration(
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(18.0)),
          borderSide: BorderSide(
            color: AppColors.lightGreyColor,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(18.0)),
          borderSide: BorderSide(
            color: AppColors.lightGreyColor,
            width: 1.5,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(18.0)),
          borderSide: BorderSide(
            color: AppColors.lightGreyColor,
          ),
        ),
        fillColor: AppColors.whiteColor,
      ),
      items: widget.list.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedValue = value;
          if(value != null){
            widget.onChange(value);
          }
        });
      },
    );
  }
}
