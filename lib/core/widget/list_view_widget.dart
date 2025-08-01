import 'package:flutter/material.dart';

import '../theme/padding.dart';

class ListViewWidget extends StatefulWidget {
  final List<dynamic> list;
  final int listLength;
  final Widget Function(dynamic item) listWidgetBuilder;

  const ListViewWidget({super.key,
    required this.list,
    required this.listLength,
    required this.listWidgetBuilder});
  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.h20Padding,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.listLength,
        itemBuilder: (context, index) {
          final item = widget.list[index];
          return widget.listWidgetBuilder(item);
        },
      ),
    );
  }
}