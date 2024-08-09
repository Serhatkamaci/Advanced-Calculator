import 'package:advanced_calculator/core/theme.dart';
import 'package:advanced_calculator/src/business_logic/provider/process_provider.dart';
import 'package:advanced_calculator/src/business_logic/provider/result_provider.dart';
import 'package:advanced_calculator/src/view/screen/graph_screen.dart';
import 'package:advanced_calculator/src/view/screen/calculator_screen.dart';
import 'package:advanced_calculator/src/view/widget/graph_widgets.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> ProcessProvider()),
        ChangeNotifierProvider(create: (context)=> ResultProvider()),
      ],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        themeMode: ThemeMode.system,
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
      ),
    );
  }
}
