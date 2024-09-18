import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yash_sherpura_budventure_task/presentation/themes/palette.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/components/spacings.dart';

class TextStyles {
  static TextStyle normal({
    Color? color = Palette.blackColor,
    FontWeight fontWeight = FontWeight.w400,
    double size = 15,
    TextDecoration? decoration,
    String? fontFamily,
  }) =>
      TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        decoration: decoration,
        fontFamily: fontFamily,
      );

  static TextStyle titleMedium({
    Color? color = Palette.blackColor,
    FontWeight fontWeight = FontWeight.bold,
    double size = Spacings.medium,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    String? fontFamily,
  }) =>
      TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        decoration: decoration,
        fontStyle: fontStyle,
        fontFamily: fontFamily,
      );

  static TextStyle textFieldHintStyle(
          {double? fontSize, FontWeight? fontWeight, Color? color}) =>
      TextStyle(
        color: color ?? Palette.lightBlackColor,
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w500,
      );

  static TextStyle header1({Color? color, FontWeight? fontWeight}) => TextStyle(
        color: color ?? Palette.greyColor,
        fontSize: 42,
        fontWeight: fontWeight ?? FontWeight.w700,
        fontStyle: FontStyle.normal,
        height: 1.1904761904761905,
      );
}
