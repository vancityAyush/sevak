import 'package:flutter/material.dart';
import 'package:sevak/utils/constants.dart';

class HeadingSubheading extends StatelessWidget {
  const HeadingSubheading(
      {Key? key, required this.title, required this.subtitle, this.onSubTap})
      : super(key: key);
  final String title;
  final String subtitle;
  final void Function()? onSubTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            color: COLOR_PURPLE,
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          onTap: onSubTap,
          child: Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
