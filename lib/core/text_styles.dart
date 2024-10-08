import 'package:flutter/material.dart';


class MyTextTheme {
  static TextStyle processStyle(BuildContext context) {
    return TextStyle(
      fontSize: 28,
      color: Theme.of(context).colorScheme.secondary,
    );
  }

  static TextStyle modalBottomSheetStyle(BuildContext context) {
    return TextStyle(
      fontSize: 20,
      color: Theme.of(context).colorScheme.secondary,
    );
  }
}
