import 'package:flutter/material.dart';

class MyButtonTheme {
  static ButtonStyle appBarButtonTheme(Size size) {
    return FilledButton.styleFrom(
      fixedSize: Size.fromWidth(size.width / 4),
    );
  }

  static ButtonStyle filledButtonTheme(
    Size size,
    bool isBigButton,
    BuildContext context,
  ) {
    return FilledButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      fixedSize: isBigButton
          ? Size(size.width / 6, size.height / 12.5)
          : Size.fromWidth((size.width - 56) / 5),
    );
  }

  static ButtonStyle filledTonalButtonTheme(Size size, bool isBigButton) {
    return FilledButton.styleFrom(
      fixedSize: isBigButton
          ? Size(size.width / 6, size.height / 12.5)
          : Size.fromWidth((size.width - 56) / 5),
    );
  }

  static ButtonStyle textButtonTheme(Size size, bool isBigButton) {
    return TextButton.styleFrom(
      textStyle: const TextStyle(fontSize: 28),
      fixedSize: isBigButton
          ? Size(size.width / 6, size.height / 12.5)
          : Size.fromWidth((size.width - 56) / 5),
    );
  }

  static InputBorder enabledFuncBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        width: 2,
      ),
    );
  }

  static InputBorder focusedFuncBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.primary,
        width: 2,
      ),
    );
  }
}
