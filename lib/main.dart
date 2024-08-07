import 'package:advanced_calculator/core/theme.dart';
import 'package:advanced_calculator/screens/graph_page.dart';
import 'package:advanced_calculator/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: const MaterialTheme(TextTheme()).light(),
      darkTheme: const MaterialTheme(TextTheme()).dark(),
      highContrastDarkTheme:
          const MaterialTheme(TextTheme()).darkHighContrast(),
      highContrastTheme: const MaterialTheme(TextTheme()).lightHighContrast(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              switch (settings.name) {
            '/' => const HomePage(),
            '/graph' => const GraphPage(),
            _ => Container(),
          },
          settings: settings,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
    );
  }
}
