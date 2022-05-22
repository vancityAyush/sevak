import 'package:flutter/material.dart';
import 'package:sevak/utils/constants.dart';
import 'package:sevak/utils/widget_functions.dart';

class LabelAndChild extends StatelessWidget {
  final String label;
  final Widget child;

  LabelAndChild({
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: TEXT_THEME_ACCENT.bodyText2,
            textAlign: TextAlign.left,
          ),
          addVerticalSpace(10),
          child,
          addVerticalSpace(14),
        ],
      ),
    );
  }
}
