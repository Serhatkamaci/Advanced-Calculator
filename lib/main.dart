import 'package:advanced_calculator/src/business_logic/cubits/garbage_collactor_cubit.dart';
import 'package:advanced_calculator/src/business_logic/cubits/process_cubit.dart';
import 'package:advanced_calculator/src/business_logic/cubits/result_cubit.dart';
import 'package:advanced_calculator/src/view/screen/calculator_screen.dart';
import 'package:advanced_calculator/src/view/screen/graph_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:advanced_calculator/core/theme.dart';
import 'package:flutter/material.dart';

void main() async => runApp(MyApp());

class MyApp extends HookWidget {

  MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    final upButtonCubit= useState(false);
    final themeModeCubit= useState(ThemeMode.system);
    final calculatorModeCubit= useState(true);
    final changeButtonCubit= useState(false);
    final functionCubit= useState("");

    return MultiBlocProvider(
      
      providers: [
        BlocProvider(create: (context)=> GarbageCollactorCubit()),
        BlocProvider(create: (context)=> ProcessCubit()),
        BlocProvider(create: (context){
          final processCubit= context.read<ProcessCubit>();
          final garbageCollactorCubit= context.read<GarbageCollactorCubit>();
          return ResultCubit(
            processCubit: processCubit, 
            upButtonCubit: upButtonCubit,
            garbageCollactorCubit: garbageCollactorCubit,
            );
        }),   
      ],

      child: MaterialApp(
        themeMode: themeModeCubit.value,
        theme: const MaterialTheme(TextTheme()).light(),
        darkTheme: const MaterialTheme(TextTheme()).dark(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                switch (settings.name) {
              '/' => CalculatorPage(
                upButtonCubit: upButtonCubit, 
                calculatorModeCubit: calculatorModeCubit,
                themeModeCubit: themeModeCubit,
                changeButtonCubit: changeButtonCubit,
                ),
              '/graph' => GraphPage(
                functionCubit: functionCubit, 
                themeModeCubit: themeModeCubit,
                ),
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
