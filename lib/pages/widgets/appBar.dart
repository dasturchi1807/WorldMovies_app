import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme.dart';

PreferredSizeWidget Appbar({String? title}) {
  return AppBar(
    elevation: 1,
    backgroundColor: Colors.transparent,
    title: Text(
      title!,
      style: AppTheme.textStyle(color: Colors.white, fontSize: 20.sp),
    ),
  );
}