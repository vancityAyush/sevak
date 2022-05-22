import 'package:flutter/material.dart';
import 'package:sevak/utils/constants.dart';
import 'package:sevak/utils/widget_functions.dart';

class LabelAndField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;

  LabelAndField({
    required this.label,
    required this.hint,
    required this.controller,
    required this.keyboardType,
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
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: COLOR_GREY.withOpacity(0.8),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: COLOR_GREY.withOpacity(0.8),
                ),
              ),
              hintText: hint,
            ),
          ),
          addVerticalSpace(14),
        ],
      ),
    );
  }
}
