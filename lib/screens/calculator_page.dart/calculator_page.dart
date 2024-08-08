import 'package:advanced_calculator/core/button_styles.dart';
import 'package:advanced_calculator/screens/calculator_page.dart/calculator_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

bool mode = false;

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false, 
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(FontAwesome.vial_solid, size: 16.sp),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FilledButton(
              style: MyButtonTheme.appBarButtonTheme(size),
              onPressed: () {},
              child: Text(
                "Calculator",
                style: TextStyle(fontSize: 12.sp),
                maxLines: 1,
              ),
            ),
            TextButton(
              style: MyButtonTheme.appBarButtonTheme(size),
              onPressed: () {
                Navigator.popAndPushNamed(context, "/graph");
              },
              child: Text(
                "Graph",
                style: TextStyle(fontSize: 12.sp),
                maxLines: 1,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.dark_mode_outlined, size: 24.sp),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 12),
              width: size.width,
              child: const ProcessTextWidget(text: "100+204+105+30+195"),
            ),
            SizedBox(
              width: size.width,
              child: const ResultTextWidget(text: "634"),
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
              icon: Icon(FontAwesome.clock, size: 20.sp),
            ),
            Divider(
              thickness: 2.0,
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              height: size.height / 2,
              child:
                  mode ? const BasicButtonsWidget() : const SciButtonsWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
