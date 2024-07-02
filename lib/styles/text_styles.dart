import 'package:ecommerce/styles/colors.dart';
import 'package:flutter/material.dart';

class Styles {
  static TextStyle x28dp700w({Color? color, double? weight, double? height}) =>
      TextStyle(
        height: height ?? 1.4,
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: color ?? AppColors.primaryColor,
      );
}
