import 'package:flutter/material.dart';

import '../../../core/colors.dart';

Container decorated(String text) {
  return Container(
    margin: EdgeInsets.only(right: 10),
    padding: EdgeInsets.all(6),
    decoration: BoxDecoration(
      color: AppColors.background,
      border: Border.all(color: AppColors.lightBlue, width: 1),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Text(text, style: TextStyle(color: AppColors.lightBlue, fontSize: 12)),
  );
}