import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextTheme {
  static TextStyle processStyle(BuildContext context) {
    return TextStyle(
      fontSize: 28.sp,
      color: Theme.of(context).colorScheme.secondary,
    );
  }
}
