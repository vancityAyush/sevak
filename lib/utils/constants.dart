import 'package:flutter/material.dart';

const COLOR_BLACK = Color.fromRGBO(48, 47, 48, 1.0);
const COLOR_GREY = Color.fromRGBO(141, 141, 141, 1.0);

const COLOR_WHITE = Colors.white;
const COLOR_DARK_BLUE = Color.fromRGBO(20, 25, 45, 1.0);
const COLOR_PURPLE = Color.fromRGBO(101, 6, 184, 1.0);
const COLOR_PURPLE_DARK = Color.fromRGBO(66, 0, 126, 1.0);
const COLOR_RED = Color.fromRGBO(255, 101, 105, 1.0);
const TextTheme TEXT_THEME_DEFAULT = TextTheme(
    headline1: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 26),
    headline2: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 22),
    headline3: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 20),
    headline4: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 16),
    headline5: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 14),
    headline6: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 12),
    bodyText1: TextStyle(
        color: COLOR_BLACK,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.5),
    bodyText2: TextStyle(
        color: COLOR_GREY,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.5),
    subtitle1: TextStyle(
        color: COLOR_BLACK, fontSize: 12, fontWeight: FontWeight.w400),
    subtitle2: TextStyle(
        color: COLOR_GREY, fontSize: 12, fontWeight: FontWeight.w400));

const TextTheme TEXT_THEME_ACCENT = TextTheme(
    headline1: TextStyle(
        color: COLOR_PURPLE, fontWeight: FontWeight.w700, fontSize: 26),
    headline2: TextStyle(
        color: COLOR_PURPLE, fontWeight: FontWeight.w700, fontSize: 24),
    headline3: TextStyle(
        color: COLOR_PURPLE, fontWeight: FontWeight.w700, fontSize: 22),
    headline4: TextStyle(
        color: COLOR_PURPLE, fontWeight: FontWeight.w700, fontSize: 20),
    headline5: TextStyle(
        color: COLOR_PURPLE, fontWeight: FontWeight.w700, fontSize: 12),
    headline6: TextStyle(
        color: COLOR_PURPLE, fontWeight: FontWeight.w700, fontSize: 10),
    bodyText1: TextStyle(
        color: COLOR_PURPLE, fontSize: 20, fontWeight: FontWeight.w400),
    bodyText2: TextStyle(
      color: COLOR_PURPLE,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    subtitle1: TextStyle(
        color: COLOR_PURPLE, fontSize: 10, fontWeight: FontWeight.w400),
    subtitle2: TextStyle(
        color: COLOR_GREY, fontSize: 10, fontWeight: FontWeight.w400));

const TextTheme TEXT_THEME_SMALL = TextTheme(
    headline1: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 22),
    headline2: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 20),
    headline3: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 18),
    headline4: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 14),
    headline5: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 12),
    headline6: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 10),
    bodyText1: TextStyle(
        color: COLOR_BLACK,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.5),
    bodyText2: TextStyle(
        color: COLOR_GREY,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.5),
    subtitle1: TextStyle(
        color: COLOR_BLACK, fontSize: 10, fontWeight: FontWeight.w400),
    subtitle2: TextStyle(
        color: COLOR_GREY, fontSize: 10, fontWeight: FontWeight.w400));

const IconData double_arrow = IconData(0xe1ff, fontFamily: 'MaterialIcons');

const EdgeInsets padding_large = EdgeInsets.all(20);
const EdgeInsets padding_small = EdgeInsets.all(8);
const EdgeInsets padding_medium = EdgeInsets.all(12);
const EdgeInsets side_padding = EdgeInsets.symmetric(horizontal: 25);
const EdgeInsets padding_top = EdgeInsets.only(top: 20);
const EdgeInsets vertical_padding = EdgeInsets.symmetric(vertical: 25);
