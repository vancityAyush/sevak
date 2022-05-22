import 'package:flutter/material.dart';
import 'package:sevak/utils/constants.dart';

class PurpleContainer extends StatelessWidget {
  final Widget child;
  final double border;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final Color? color;
  final void Function()? onTap;
  const PurpleContainer(
      {Key? key,
      required this.child,
      this.border = 10,
      this.padding,
      this.margin,
      this.width,
      this.height,
      this.onTap,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        width: width,
        height: height,
        padding: padding ?? const EdgeInsets.all(10),
        margin: margin ?? const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(border),
          color: color ?? COLOR_PURPLE_DARK,
        ),
        child: Center(child: child),
      ),
    );
  }
}
