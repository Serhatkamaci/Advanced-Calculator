import 'package:advanced_calculator/src/business_logic/bloc/garbage_bloc.dart';
import 'package:advanced_calculator/src/business_logic/bloc/process_bloc.dart';
import 'package:advanced_calculator/src/business_logic/bloc/result_bloc.dart';
import 'package:advanced_calculator/core/button_styles.dart';
import 'package:advanced_calculator/core/text_styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter/material.dart';

class ProcessTextWidget extends StatelessWidget {
  const ProcessTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      context.select((ProcessBloc bloc) => bloc.state),
      style: MyTextTheme.processStyle(context),
      textAlign: TextAlign.end,
      minFontSize: 20,
      maxFontSize: 44,
    );
  }
}

class ResultTextWidget extends StatelessWidget {
  const ResultTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      context.select((ResultBloc bloc) => bloc.state).length > 7
          ? double.parse(context.select((ResultBloc bloc) => bloc.state))
              .toStringAsExponential(7)
          : context.select((ResultBloc bloc) => bloc.state),
      maxLines: 1,
      minFontSize: 30,
      maxFontSize: 56,
      textAlign: TextAlign.end,
      style: const TextStyle(fontSize: 56),
    );
  }
}

//? Buttons

class FilledButtonWidget extends StatelessWidget {
  final void Function() func;
  final Widget child;
  final bool isBigButton;

  const FilledButtonWidget({
    super.key,
    required this.child,
    required this.func,
    this.isBigButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FilledButton(
      onPressed: func,
      style: MyButtonTheme.filledButtonTheme(size, isBigButton, context),
      child: child,
    );
  }
}

class FilledButtonTonalWidget extends StatelessWidget {
  final void Function() func;
  final Widget child;
  final bool isBigButton;
  final bool isSelected;

  const FilledButtonTonalWidget({
    super.key,
    required this.child,
    required this.func,
    this.isBigButton = false,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FilledButton.tonal(
      onPressed: func,
      style: MyButtonTheme.filledTonalButtonTheme(
        size,
        context,
        isBigButton,
        isSelected,
      ),
      child: child,
    );
  }
}

class TextButtonWidget extends StatelessWidget {
  final void Function() func;
  final Widget child;
  final bool isBigButton;

  const TextButtonWidget({
    super.key,
    required this.func,
    required this.child,
    this.isBigButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TextButton(
      style: MyButtonTheme.textButtonTheme(size, isBigButton),
      onPressed: func,
      child: child,
    );
  }
}

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({
    super.key,
    required this.size,
    required this.calculatorModeVariable,
    required this.upButtonVariable,
    required this.changeButtonVariable,
  });

  final Size size;
  final ValueNotifier<bool> calculatorModeVariable;
  final ValueNotifier<bool> upButtonVariable;
  final ValueNotifier<bool> changeButtonVariable;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      height: size.height / 2,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: calculatorModeVariable.value
            ? BasicButtonsWidget(
                upButtonVariable: upButtonVariable,
              )
            : SciButtonsWidget(
                changeButtonVariable: changeButtonVariable,
                upButtonVariable: upButtonVariable,
              ),
      ),
    );
  }
}

class CalculatorModeButtonWidget extends StatelessWidget {
  const CalculatorModeButtonWidget({
    super.key,
    required this.calculatorModeVariable,
  });

  final ValueNotifier<bool> calculatorModeVariable;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        calculatorModeVariable.value = !calculatorModeVariable.value;
      },
      icon: const Icon(FontAwesome.vial_solid, size: 16),
    );
  }
}

class ThemeModeButtonWidget extends StatelessWidget {
  final ValueNotifier<ThemeMode> themeModeVariable;
  const ThemeModeButtonWidget({
    super.key,
    required this.themeModeVariable,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        themeModeVariable.value = themeModeVariable.value == ThemeMode.light
            ? ThemeMode.dark
            : ThemeMode.light;
      },
      icon: Icon(
        themeModeVariable.value == ThemeMode.light
            ? Icons.dark_mode_outlined
            : Icons.light_mode_outlined,
        size: 24,
      ),
    );
  }
}

class BasicButtonsWidget extends StatelessWidget {
  final ValueNotifier<bool> upButtonVariable;
  const BasicButtonsWidget({
    super.key,
    required this.upButtonVariable,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilledButtonWidget(
              func: () {
                isEqual = false;
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "C"),
                    );
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "C"),
                    );
              },
              isBigButton: true,
              child: const Text(
                "C",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            FilledButtonWidget(
              func: () {
                if (BlocProvider.of<ProcessBloc>(context)
                    .pastProcessList
                    .isNotEmpty) {
                  context.read<ProcessBloc>().add(
                        const AddtoProcess(process: "<-"),
                      );
                  context.read<ResultBloc>().add(
                        const AddtoProcessInResult(process: "<-"),
                      );
                }
              },
              isBigButton: true,
              child: const Icon(FontAwesome.left_long_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "\u0025"),
                    );
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "\u0025"),
                    );
              },
              isBigButton: true,
              child: const Icon(FontAwesome.percent_solid, size: 20),
            ),
            FilledButtonTonalWidget(
              func: () {
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "\u00F7"),
                    );
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "\u00F7"),
                    );
              },
              isBigButton: true,
              child: const Icon(FontAwesome.divide_solid, size: 20),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButtonWidget(
              func: () {
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "7"),
                    );
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "7"),
                    );
              },
              isBigButton: true,
              child: const Text("7", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "8"),
                    );
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "8"),
                    );
              },
              isBigButton: true,
              child: const Text("8", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "9"),
                    );
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "9"),
                    );
              },
              isBigButton: true,
              child: const Text("9", style: TextStyle(fontSize: 28)),
            ),
            FilledButtonTonalWidget(
              func: () {
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "\u00D7"),
                    );
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "\u00D7"),
                    );
              },
              isBigButton: true,
              child: const Icon(FontAwesome.xmark_solid, size: 20),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButtonWidget(
              func: () {
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "4"),
                    );
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "4"),
                    );
              },
              isBigButton: true,
              child: const Text("4", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "5"),
                    );
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "5"),
                    );
              },
              isBigButton: true,
              child: const Text("5", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "6"),
                    );
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "6"),
                    );
              },
              isBigButton: true,
              child: const Text("6", style: TextStyle(fontSize: 28)),
            ),
            FilledButtonTonalWidget(
              func: () {
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "\u2212"),
                    );
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "\u2212"),
                    );
              },
              isBigButton: true,
              child: const Icon(FontAwesome.minus_solid, size: 20),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButtonWidget(
              func: () {
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "1"),
                    );
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "1"),
                    );
              },
              isBigButton: true,
              child: const Text("1", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "2"),
                    );
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "2"),
                    );
              },
              isBigButton: true,
              child: const Text("2", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "3"),
                    );
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "3"),
                    );
              },
              isBigButton: true,
              child: const Text("3", style: TextStyle(fontSize: 28)),
            ),
            FilledButtonTonalWidget(
              func: () {
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "\u002B"),
                    );
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "\u002B"),
                    );
              },
              isBigButton: true,
              child: const Icon(FontAwesome.plus_solid, size: 20),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButtonWidget(
              func: () {
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "ö"),
                    );
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "="),
                    );
              },
              isBigButton: true,
              child: const Icon(FontAwesome.plus_minus_solid, size: 20),
            ),
            TextButtonWidget(
              func: () {
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "0"),
                    );
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "0"),
                    );
              },
              isBigButton: true,
              child: const Text("0", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {
                if (!upButtonVariable.value) {
                  context.read<ProcessBloc>().add(
                        const AddtoProcess(process: ","),
                      );
                  context.read<ResultBloc>().add(
                        const AddtoProcessInResult(process: ","),
                      );
                }
              },
              isBigButton: true,
              child: const Text(",", style: TextStyle(fontSize: 28)),
            ),
            FilledButtonWidget(
              func: () {
                if (BlocProvider.of<ProcessBloc>(context)
                    .pastProcessList
                    .isNotEmpty) {
                  context.read<ResultBloc>().add(
                        const AddtoProcessInResult(process: "="),
                      );
                }
              },
              isBigButton: true,
              child: const Icon(FontAwesome.equals_solid, size: 20),
            ),
          ],
        ),
      ],
    );
  }
}

class SciButtonsWidget extends StatelessWidget {
  const SciButtonsWidget({
    super.key,
    required this.upButtonVariable,
    required this.changeButtonVariable,
  });

  final ValueNotifier<bool> upButtonVariable;
  final ValueNotifier<bool> changeButtonVariable;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilledButtonWidget(
              func: () {
                isEqual = false;
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "C"),
                    );
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "C"),
                    );
              },
              child: const Text(
                "C",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            FilledButtonWidget(
              func: () {
                if (BlocProvider.of<ProcessBloc>(context)
                    .pastProcessList
                    .isNotEmpty) {
                  context.read<ProcessBloc>().add(
                        const AddtoProcess(process: "<-"),
                      );
                  context.read<ResultBloc>().add(
                        const AddtoProcessInResult(process: "<-"),
                      );
                }
              },
              child: const Icon(FontAwesome.left_long_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "\u0025"),
                    );
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "\u0025"),
                    );
              },
              child: const Icon(FontAwesome.percent_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "\u00F7"),
                    );
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "\u00F7"),
                    );
              },
              child: const Icon(FontAwesome.divide_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "\u00D7"),
                    );
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "\u00D7"),
                    );
              },
              child: const Icon(FontAwesome.xmark_solid, size: 16),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButtonWidget(
              func: () {
                if (upButtonVariable.value) {
                  context.read<ProcessBloc>().add(
                        const AddtoProcess(process: "\u2077"),
                      );
                  context.read<ResultBloc>().add(
                        const AddtoProcessInResult(process: "\u2077"),
                      );
                } else {
                  context.read<ProcessBloc>().add(
                        const AddtoProcess(process: "7"),
                      );
                  context.read<ResultBloc>().add(
                        const AddtoProcessInResult(process: "7"),
                      );
                }
              },
              child: const SpecialTextWidget(text: "7"),
            ),
            TextButtonWidget(
              func: () {
                if (upButtonVariable.value) {
                  context.read<ProcessBloc>().add(
                        const AddtoProcess(process: "\u2078"),
                      );
                  context.read<ResultBloc>().add(
                        const AddtoProcessInResult(process: "\u2078"),
                      );
                } else {
                  context.read<ProcessBloc>().add(
                        const AddtoProcess(process: "8"),
                      );
                  context.read<ResultBloc>().add(
                        const AddtoProcessInResult(process: "8"),
                      );
                }
              },
              child: const SpecialTextWidget(text: "8"),
            ),
            TextButtonWidget(
              func: () {
                if (upButtonVariable.value) {
                  context.read<ProcessBloc>().add(
                        const AddtoProcess(process: "\u2079"),
                      );
                  context.read<ResultBloc>().add(
                        const AddtoProcessInResult(process: "\u2079"),
                      );
                } else {
                  context.read<ProcessBloc>().add(
                        const AddtoProcess(process: "9"),
                      );
                  context.read<ResultBloc>().add(
                        const AddtoProcessInResult(process: "9"),
                      );
                }
              },
              child: const SpecialTextWidget(text: "9"),
            ),
            FilledButtonTonalWidget(
              func: () {
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "\u2212"),
                    );
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "\u2212"),
                    );
              },
              child: const Icon(FontAwesome.minus_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "\u002B"),
                    );
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "\u002B"),
                    );
              },
              child: const Icon(FontAwesome.plus_solid, size: 16),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButtonWidget(
              func: () {
                if (upButtonVariable.value) {
                  context.read<ProcessBloc>().add(
                        const AddtoProcess(process: "\u2074"),
                      );
                  context.read<ResultBloc>().add(
                        const AddtoProcessInResult(process: "\u2074"),
                      );
                } else {
                  context.read<ProcessBloc>().add(
                        const AddtoProcess(process: "4"),
                      );
                  context.read<ResultBloc>().add(
                        const AddtoProcessInResult(process: "4"),
                      );
                }
              },
              child: const SpecialTextWidget(text: "4"),
            ),
            TextButtonWidget(
              func: () {
                if (upButtonVariable.value) {
                  context.read<ProcessBloc>().add(
                        const AddtoProcess(process: "\u2075"),
                      );
                  context.read<ResultBloc>().add(
                        const AddtoProcessInResult(process: "\u2075"),
                      );
                } else {
                  context.read<ProcessBloc>().add(
                        const AddtoProcess(process: "5"),
                      );
                  context.read<ResultBloc>().add(
                        const AddtoProcessInResult(process: "5"),
                      );
                }
              },
              child: const SpecialTextWidget(text: "5"),
            ),
            TextButtonWidget(
              func: () {
                if (upButtonVariable.value) {
                  context.read<ProcessBloc>().add(
                        const AddtoProcess(process: "\u2076"),
                      );
                  context.read<ResultBloc>().add(
                        const AddtoProcessInResult(process: "\u2076"),
                      );
                } else {
                  context.read<ProcessBloc>().add(
                        const AddtoProcess(process: "6"),
                      );
                  context.read<ResultBloc>().add(
                        const AddtoProcessInResult(process: "6"),
                      );
                }
              },
              child: const SpecialTextWidget(text: "6"),
            ),
            FilledButtonTonalWidget(
              func: () {
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "\u221A("),
                    );
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "\u221A("),
                    );
                parenthesesCount++;
              },
              child: const Icon(
                FontAwesome.square_root_variable_solid,
                size: 16,
              ),
            ),
            FilledButtonTonalWidget(
              func: () {
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "\u00B2"),
                    );
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "q"),
                    );
              },
              child: const SpecialFilledTextWidget(text: "x\u00B2"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButtonWidget(
              func: () {
                if (upButtonVariable.value) {
                  context.read<ProcessBloc>().add(
                        const AddtoProcess(process: "\u00B9"),
                      );
                  context.read<ResultBloc>().add(
                        const AddtoProcessInResult(process: "\u00B9"),
                      );
                } else {
                  context.read<ProcessBloc>().add(
                        const AddtoProcess(process: "1"),
                      );
                  context.read<ResultBloc>().add(
                        const AddtoProcessInResult(process: "1"),
                      );
                }
              },
              child: const SpecialTextWidget(text: "1"),
            ),
            TextButtonWidget(
              func: () {
                if (upButtonVariable.value) {
                  context.read<ProcessBloc>().add(
                        const AddtoProcess(process: "\u00B2"),
                      );
                  context.read<ResultBloc>().add(
                        const AddtoProcessInResult(process: "\u00B2"),
                      );
                } else {
                  context.read<ProcessBloc>().add(
                        const AddtoProcess(process: "2"),
                      );
                  context.read<ResultBloc>().add(
                        const AddtoProcessInResult(process: "2"),
                      );
                }
              },
              child: const SpecialTextWidget(text: "2"),
            ),
            TextButtonWidget(
              func: () {
                if (upButtonVariable.value) {
                  context.read<ProcessBloc>().add(
                        const AddtoProcess(process: "\u00B3"),
                      );
                  context.read<ResultBloc>().add(
                        const AddtoProcessInResult(process: "\u00B3"),
                      );
                } else {
                  context.read<ProcessBloc>().add(
                        const AddtoProcess(process: "3"),
                      );
                  context.read<ResultBloc>().add(
                        const AddtoProcessInResult(process: "3"),
                      );
                }
              },
              child: const SpecialTextWidget(text: "3"),
            ),
            FilledButtonTonalWidget(
              isSelected: upButtonVariable.value,
              func: () {
                if (BlocProvider.of<ProcessBloc>(context)
                    .pastProcessList
                    .isNotEmpty) {
                  upButtonVariable.value = !upButtonVariable.value;
                  upButtonVariable.value
                      ? context.read<ResultBloc>().add(
                            const AddtoProcessInResult(process: "wğ"),
                          )
                      : context.read<ResultBloc>().add(
                            const AddtoProcessInResult(process: "ü"),
                          );
                }
              },
              child: SpecialFilledTextWidget(
                text: "^",
                isSelected: upButtonVariable.value,
              ),
            ),
            FilledButtonTonalWidget(
              func: () {
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "()"),
                    );
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "()"),
                    );
              },
              child: const SpecialFilledTextWidget(text: "( )"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilledButtonTonalWidget(
              func: () {
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "ö"),
                    );
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "="),
                    );
              },
              child: const Icon(FontAwesome.plus_minus_solid, size: 16),
            ),
            TextButtonWidget(
              func: () {
                if (upButtonVariable.value) {
                  context.read<ProcessBloc>().add(
                        const AddtoProcess(process: "\u2070"),
                      );
                  context.read<ResultBloc>().add(
                        const AddtoProcessInResult(process: "\u2070"),
                      );
                } else {
                  context.read<ProcessBloc>().add(
                        const AddtoProcess(process: "0"),
                      );
                  context.read<ResultBloc>().add(
                        const AddtoProcessInResult(process: "0"),
                      );
                }
              },
              child: const SpecialTextWidget(text: "0"),
            ),
            TextButtonWidget(
              func: () {
                if (!upButtonVariable.value) {
                  context.read<ProcessBloc>().add(
                        const AddtoProcess(process: ","),
                      );
                  context.read<ResultBloc>().add(
                        const AddtoProcessInResult(process: ","),
                      );
                }
              },
              child: const SpecialTextWidget(text: ","),
            ),
            FilledButtonTonalWidget(
              func: () {
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "rad("),
                    );
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "rad("),
                    );
                parenthesesCount++;
              },
              child: const SpecialFilledTextWidget(text: "Rad"),
            ),
            FilledButtonTonalWidget(
              func: () {
                changeButtonVariable.value = !changeButtonVariable.value;
              },
              isSelected: changeButtonVariable.value,
              child: Icon(
                FontAwesome.right_left_solid,
                size: 14,
                color: changeButtonVariable.value
                    ? Theme.of(context).colorScheme.onPrimary
                    : null,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilledButtonTonalWidget(
              func: () {
                changeButtonVariable.value
                    ? {
                        context.read<ProcessBloc>().add(
                              const AddtoProcess(process: "arcsin("),
                            ),
                        context.read<ResultBloc>().add(
                              const AddtoProcessInResult(process: "arcsin("),
                            ),
                      }
                    : {
                        context.read<ProcessBloc>().add(
                              const AddtoProcess(process: "sin("),
                            ),
                        context.read<ResultBloc>().add(
                              const AddtoProcessInResult(process: "sin("),
                            ),
                      };
                parenthesesCount++;
              },
              isSelected: changeButtonVariable.value,
              child: SpecialFilledTextWidget(
                text: "sin",
                isSelected: changeButtonVariable.value,
              ),
            ),
            FilledButtonTonalWidget(
              func: () {
                changeButtonVariable.value
                    ? {
                        context.read<ProcessBloc>().add(
                              const AddtoProcess(process: "arccos("),
                            ),
                        context.read<ResultBloc>().add(
                              const AddtoProcessInResult(process: "arccos("),
                            ),
                      }
                    : {
                        context.read<ProcessBloc>().add(
                              const AddtoProcess(process: "cos("),
                            ),
                        context.read<ResultBloc>().add(
                              const AddtoProcessInResult(process: "cos("),
                            ),
                      };
                parenthesesCount++;
              },
              isSelected: changeButtonVariable.value,
              child: SpecialFilledTextWidget(
                text: "cos",
                isSelected: changeButtonVariable.value,
              ),
            ),
            FilledButtonTonalWidget(
              func: () {
                changeButtonVariable.value
                    ? {
                        context.read<ProcessBloc>().add(
                              const AddtoProcess(process: "arctan("),
                            ),
                        context.read<ResultBloc>().add(
                              const AddtoProcessInResult(process: "arctan("),
                            ),
                      }
                    : {
                        context.read<ProcessBloc>().add(
                              const AddtoProcess(process: "tan("),
                            ),
                        context.read<ResultBloc>().add(
                              const AddtoProcessInResult(process: "tan("),
                            ),
                      };
                parenthesesCount++;
              },
              isSelected: changeButtonVariable.value,
              child: SpecialFilledTextWidget(
                text: "tan",
                isSelected: changeButtonVariable.value,
              ),
            ),
            FilledButtonTonalWidget(
              func: () {
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "π"),
                    );
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "π"),
                    );
              },
              child: const SpecialFilledTextWidget(text: "π"),
            ),
            FilledButtonTonalWidget(
              func: () {
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "e"),
                    );
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "e"),
                    );
              },
              child: const SpecialFilledTextWidget(text: "e"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilledButtonTonalWidget(
              func: () {
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "ln("),
                    );
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "ln("),
                    );
                parenthesesCount++;
              },
              child: const SpecialFilledTextWidget(text: "ln"),
            ),
            FilledButtonTonalWidget(
              func: () {
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "log("),
                    );
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "log("),
                    );
                parenthesesCount++;
              },
              child: const SpecialFilledTextWidget(text: "log"),
            ),
            FilledButtonTonalWidget(
              func: () {
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "1/x"),
                    );
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "1/x"),
                    );
              },
              child: const SpecialFilledTextWidget(text: "1/x"),
            ),
            FilledButtonTonalWidget(
              func: () {
                context.read<ResultBloc>().add(
                      const AddtoProcessInResult(process: "abs("),
                    );
                context.read<ProcessBloc>().add(
                      const AddtoProcess(process: "abs("),
                    );
                parenthesesCount++;
              },
              child: const SpecialFilledTextWidget(text: "|x|"),
            ),
            FilledButtonWidget(
              func: () {
                if (upButtonVariable.value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        "You haven't finished the up process!",
                        textAlign: TextAlign.center,
                      ),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  );
                } else if (parenthesesCount != 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        "There is a parenthesis error!",
                        textAlign: TextAlign.center,
                      ),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  );
                } else if (BlocProvider.of<ProcessBloc>(context)
                    .pastProcessList
                    .isNotEmpty) {
                  context.read<ResultBloc>().add(
                        const AddtoProcessInResult(process: "="),
                      );
                }
              },
              child: const Icon(FontAwesome.equals_solid, size: 16),
            ),
          ],
        ),
      ],
    );
  }
}

class SpecialTextWidget extends StatelessWidget {
  final String text;

  const SpecialTextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(fontSize: 24));
  }
}

class SpecialFilledTextWidget extends StatelessWidget {
  final String text;
  final bool isSelected;

  const SpecialFilledTextWidget({
    super.key,
    required this.text,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: !isSelected ? null : Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}

//? BottomSheet

class BottomSheetWidget extends StatelessWidget {
  final Size size;
  const BottomSheetWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3,
      width: size.width,
      child: Stack(
        children: [
          BlocProvider.of<GarbageBloc>(context).state.isEmpty
              ? Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Nothing here!",
                    style: MyTextTheme.modalBottomSheetStyle(context),
                  ),
                )
              : ListView.builder(
                  itemCount: BlocProvider.of<GarbageBloc>(context).state.length,
                  itemBuilder: (context, index) {
                    return PastItemWidget(
                      proces: BlocProvider.of<GarbageBloc>(context)
                          .state
                          .keys
                          .toList()[index],
                      result: BlocProvider.of<GarbageBloc>(context)
                          .state
                          .values
                          .toList()[index],
                    );
                  },
                ),
          Positioned(
            bottom: 16,
            left: 16,
            child: IconButton.filledTonal(
              icon: const Icon(FontAwesome.trash_solid, size: 16),
              onPressed: () {
                isEqual = false;
                context.read<GarbageBloc>().add(const ClearGarbage());
                context
                    .read<ResultBloc>()
                    .add(const AddtoProcessInResult(process: "C"));
                context
                    .read<ProcessBloc>()
                    .add(const AddtoProcess(process: "C"));
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PastItemWidget extends StatelessWidget {
  final String proces;
  final String result;

  const PastItemWidget({
    super.key,
    required this.proces,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Align(
            alignment: Alignment.centerRight,
            child: Text(
              proces,
              textAlign: TextAlign.right,
            ),
          ),
          subtitle: Align(
            alignment: Alignment.centerRight,
            child: Text(
              result,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 110, right: 20),
          child: Divider(
            thickness: 2,
          ),
        ),
      ],
    );
  }
}
