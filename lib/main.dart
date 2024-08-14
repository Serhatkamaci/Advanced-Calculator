import 'package:advanced_calculator/src/controller/garbage_controller.dart';
import 'package:advanced_calculator/src/controller/general_variable.dart';
import 'package:advanced_calculator/src/controller/process_controller.dart';
import 'package:advanced_calculator/src/controller/result_controller.dart';
import 'package:advanced_calculator/src/view/screen/calculator_screen.dart';
import 'package:advanced_calculator/src/view/screen/graph_screen.dart';
import 'package:advanced_calculator/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(ProcessController(), permanent: true);
  Get.put(GarbageController(), permanent: true);
  Get.put(ResultController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return GetMaterialApp(
          themeMode: themeModeVariable.value,
          theme: const MaterialTheme(TextTheme()).light(),
          darkTheme: const MaterialTheme(TextTheme()).dark(),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (settings) {
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  switch (settings.name) {
                '/' => const CalculatorPage(),
                '/graph' => const GraphPage(),
                _ => Container(),
              },
              settings: settings,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );
          },
        );
      },
    );
  }
}
