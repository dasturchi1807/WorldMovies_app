import 'dart:ui';

import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {

  static AppBarTheme appBarTheme() {
    return const AppBarTheme(
        backgroundColor: AppColors.background,
        titleTextStyle: TextStyle(
            color: AppColors.white,
            fontSize: 20,
        ),
        centerTitle: true
    );
  }

  static Positioned appBarBackgroundTheme(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            height: MediaQuery.of(context).padding.top + kToolbarHeight,
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }

  static TextStyle textStyle({Color? color, double? fontSize, FontWeight? fontWeight}) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

}