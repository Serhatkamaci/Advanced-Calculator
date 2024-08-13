import 'package:advanced_calculator/core/button_styles.dart';
import 'package:advanced_calculator/src/view/widget/calculator_widgets.dart';
import 'package:advanced_calculator/src/view/widget/graph_widgets.dart';
import 'package:flutter/material.dart';

class GraphPage extends StatelessWidget {

  final functionCubit;
  final themeModeCubit;
  const GraphPage({
    super.key, 
    required this.functionCubit, 
    required this.themeModeCubit,
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
          ThemeModeButtonWidget(themeModeCubit:  themeModeCubit,),
        ],
      ),
      body: Stack(
        children: [
          GraphWidget(functionCubit: functionCubit),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 20),
            child: FunctionTextField(functionCubit: functionCubit),
          ),
        ],
      ),
    );
  }
}
