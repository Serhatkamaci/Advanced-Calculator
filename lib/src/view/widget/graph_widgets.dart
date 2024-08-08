import 'package:advanced_calculator/core/button_styles.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class FunctionTextField extends StatelessWidget {
  const FunctionTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      decoration: InputDecoration(
        suffixIcon: const Icon(FontAwesome.circle_xmark, size: 24),
        enabledBorder: MyButtonTheme.enabledFuncBorder(context),
        focusedBorder: MyButtonTheme.focusedFuncBorder(context),
        labelText: "function",
        hintText: "e.g: x^2",
      ),
    );
  }
}
