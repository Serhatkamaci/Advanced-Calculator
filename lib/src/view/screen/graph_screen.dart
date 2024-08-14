import 'package:advanced_calculator/core/button_styles.dart';
import 'package:advanced_calculator/src/view/widget/calculator_widgets.dart';
import 'package:advanced_calculator/src/view/widget/graph_widgets.dart';
import 'package:flutter/material.dart';

class GraphPage extends StatelessWidget {
  final ValueNotifier<ThemeMode> themeModeVariable;
  final ValueNotifier<String> functionVariable;
  const GraphPage({
    super.key,
    required this.themeModeVariable,
    required this.functionVariable,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leading: const SizedBox(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              style: MyButtonTheme.appBarButtonTheme(size),
              onPressed: () {
                Navigator.popAndPushNamed(context, "/");
              },
              child: const Text(
                "Calculator",
                style: TextStyle(fontSize: 12),
                maxLines: 1,
              ),
            ),
            FilledButton(
              style: MyButtonTheme.appBarButtonTheme(size),
              onPressed: () {},
              child: const Text(
                "Graph",
                style: TextStyle(fontSize: 12),
                maxLines: 1,
              ),
            ),
          ],
        ),
        actions: [
          ThemeModeButtonWidget(
            themeModeVariable: themeModeVariable,
          ),
        ],
      ),
      body: Stack(
        children: [
          GraphWidget(functionVariable: functionVariable),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
            child: FunctionTextField(functionVariable: functionVariable),
          ),
        ],
      ),
    );
  }
}
