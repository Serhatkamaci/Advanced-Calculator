import 'package:advanced_calculator/core/theme.dart';
import 'package:advanced_calculator/screens/graph_page/graph_page.dart';
import 'package:advanced_calculator/screens/calculator_page.dart/calculator_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411.42, 866.28),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          themeMode: ThemeMode.dark,
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
