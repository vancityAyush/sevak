import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sevak/utils/constants.dart';

Widget backButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      shape: CircleBorder(),
      padding: const EdgeInsets.all(8),
      primary: COLOR_RED, // <-- Button color
      onPrimary: COLOR_WHITE, // <-- Splash color
    ),
    child: Transform.rotate(
      angle: pi,
      child: Icon(
        Icons.double_arrow,
        color: Colors.white,
        size: 20,
      ),
    ),
  );
}

Widget backButton2(context, {Color color = Colors.black, double size = 30}) =>
    IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: color,
        size: size,
      ),
      onPressed: () => Navigator.of(context).pop(),
    );

Widget addVerticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget doubleArrowIcon() {
  return const CircleAvatar(
    backgroundColor: COLOR_RED,
    child: Icon(
      Icons.double_arrow,
      color: Colors.white,
      size: 20,
    ),
  );
}

Widget addHorizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

EdgeInsets verticalPadding(double size) => EdgeInsets.symmetric(vertical: size);
