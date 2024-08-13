import 'package:advanced_calculator/src/view/widget/calculator_widgets.dart';
import 'package:advanced_calculator/core/button_styles.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';



class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leading: const CalculatorModeButtonWidget(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FilledButton(
              style: MyButtonTheme.appBarButtonTheme(size),
              onPressed: () {},
              child: const Text(
                "Calculator",
                style: TextStyle(fontSize: 12),
                maxLines: 1,
              ),
            ),
            TextButton(
              style: MyButtonTheme.appBarButtonTheme(size),
              onPressed: () {
                Navigator.popAndPushNamed(context, "/graph");
              },
              child: const Text(
                "Graph",
                style: TextStyle(fontSize: 12),
                maxLines: 1,
              ),
            ),
          ],
        ),
        actions: const [
          ThemeModeButtonWidget(),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomRight,
                width: size.width,
                padding: const EdgeInsets.only(bottom: 12),
                child: const ProcessTextWidget(),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                width: size.width,
                child: const ResultTextWidget(),
              ),
            ),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  showDragHandle: true,
                  context: context,
                  builder: (BuildContext context) {
                    return BottomSheetWidget(size: size);
                  },
                );
              },
              icon: const Icon(FontAwesome.clock, size: 20),
            ),
            Divider(
              thickness: 2.0,
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
            ButtonsWidget(size: size),
          ],
        ),
      ),
    );
  }
}
