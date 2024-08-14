import 'package:advanced_calculator/src/business_logic/bloc/garbage_bloc.dart';
import 'package:advanced_calculator/src/business_logic/bloc/process_bloc.dart';
import 'package:advanced_calculator/src/business_logic/bloc/result_bloc.dart';
import 'package:advanced_calculator/src/view/screen/calculator_screen.dart';
import 'package:advanced_calculator/src/view/screen/graph_screen.dart';
import 'package:advanced_calculator/core/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

void main() async => runApp(const MyApp());

class MyApp extends HookWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeModeVariable = useState(ThemeMode.system);
    final calculatorModeVariable = useState(true);
    final upButtonProvider = useState(false);
    final changeButtonProvider = useState(false);
    final functionProvider = useState("");

    return MultiBlocProvider(
      providers: [
        BlocProvider<ProcessBloc>(
          create: (BuildContext context) => ProcessBloc(),
        ),
        BlocProvider<GarbageBloc>(
          create: (BuildContext context) => GarbageBloc(),
        ),
        BlocProvider<ResultBloc>(
          create: (BuildContext context) => ResultBloc(
            garbageBloc: BlocProvider.of<GarbageBloc>(context),
            processBloc: BlocProvider.of<ProcessBloc>(context),
            upButtonVariable: upButtonProvider,
          ),
        ),
      ],
      child: MaterialApp(
        themeMode: themeModeVariable.value,
        theme: const MaterialTheme(TextTheme()).light(),
        darkTheme: const MaterialTheme(TextTheme()).dark(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                switch (settings.name) {
              '/' => CalculatorPage(
                  themeModeVariable: themeModeVariable,
                  calculatorModeVariable: calculatorModeVariable,
                  upButtonVariable: upButtonProvider,
                  changeButtonVariable: changeButtonProvider,
                ),
              '/graph' => GraphPage(
                  themeModeVariable: themeModeVariable,
                  functionVariable: functionProvider,
                ),
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
      ),
    );
  }
}
