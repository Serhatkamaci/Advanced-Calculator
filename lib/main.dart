import 'package:advanced_calculator/src/business_logic/provider/general_providers.dart';
import 'package:advanced_calculator/src/view/screen/calculator_screen.dart';
import 'package:advanced_calculator/src/view/screen/graph_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:advanced_calculator/core/theme.dart';
import 'package:flutter/material.dart';

void main() async => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      themeMode: ref.watch(themeModeProvider),
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
