import 'package:advanced_calculator/core/button_styles.dart';
import 'package:advanced_calculator/screens/graph_page/graph_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GraphPage extends StatelessWidget {
  const GraphPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
              child: Text(
                "Calculator",
                style: TextStyle(fontSize: 14.sp),
                maxLines: 1,
              ),
            ),
            FilledButton(
              style: MyButtonTheme.appBarButtonTheme(size),
              onPressed: () {},
              child: Text(
                "Graph",
                style: TextStyle(fontSize: 14.sp),
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
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 20),
            child: FunctionTextField(),
          ),
        ],
      ),
    );
  }
}
