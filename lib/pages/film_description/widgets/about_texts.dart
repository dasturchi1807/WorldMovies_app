import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/colors.dart';
import '../../../core/theme.dart';

Expanded about(String text, String value) {
  int len = value.length;
  return Expanded(
    child: ListTile(
        title:
            Text(text, style: AppTheme.textStyle(color: Colors.white)),
        subtitle: len > 2
            ? Text(value,
                style: TextStyle(fontSize: 15.sp, color: AppColors.grey))
            : Text(
                value == 'en' ? "English" : "Other",
                style: TextStyle(fontSize: 15.sp, color: AppColors.grey),
              )),
  );
}