import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:sevak/utils/constants.dart';

class DottedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final double? radius;
  final Color? color;
  const DottedContainer(
      {Key? key, required this.child, this.padding, this.radius, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(radius ?? 8),
      padding: padding ?? const EdgeInsets.all(12),
      color: color ?? COLOR_PURPLE.withOpacity(0.8),
      child: Center(child: child),
    );
  }
}
