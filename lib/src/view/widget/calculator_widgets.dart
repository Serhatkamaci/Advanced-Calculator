import 'package:advanced_calculator/core/button_styles.dart';
import 'package:advanced_calculator/core/text_styles.dart';
import 'package:advanced_calculator/src/business_logic/cubits/garbage_collactor_cubit.dart';
import 'package:advanced_calculator/src/business_logic/cubits/process_cubit.dart';
import 'package:advanced_calculator/src/business_logic/cubits/result_cubit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class ProcessTextWidget extends StatelessWidget {
  const ProcessTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProcessCubit, String>(
      builder: (context, state) {
        return AutoSizeText(
          state,
          style: MyTextTheme.processStyle(context),
          textAlign: TextAlign.end,
          minFontSize: 20,
          maxFontSize: 44,
        );
      },
    );
  }
}

class ResultTextWidget extends StatelessWidget {
  const ResultTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResultCubit, String>(
      builder: (context, state) {
        return AutoSizeText(
          state.length > 7
              ? double.parse(state).toStringAsExponential(7)
              : state,
          maxLines: 1,
          minFontSize: 30,
          maxFontSize: 56,
          textAlign: TextAlign.end,
          style: const TextStyle(fontSize: 56),
        );
      },
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
  final Size size;
  final upButtonCubit;
  final calculatorModeCubit;
  final changeButtonCubit;

  const ButtonsWidget({
    super.key,
    required this.size,
    required this.upButtonCubit,
    required this.calculatorModeCubit,
    required this.changeButtonCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      height: size.height / 2,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: calculatorModeCubit.value
            ? BasicButtonsWidget(
                upButtonCubit: upButtonCubit,
              )
            : SciButtonsWidget(
                upButtonCubit: upButtonCubit,
                changeButtonCubit: changeButtonCubit,
              ),
      ),
    );
  }
}

class CalculatorModeButtonWidget extends StatelessWidget {
  final calculatorModeCubit;
  const CalculatorModeButtonWidget({
    super.key,
    required this.calculatorModeCubit,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        calculatorModeCubit.value = !calculatorModeCubit.value;
      },
      icon: const Icon(FontAwesome.vial_solid, size: 16),
    );
  }
}

class ThemeModeButtonWidget extends StatelessWidget {
  
  final themeModeCubit;
  ThemeModeButtonWidget({
    required this.themeModeCubit,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        themeModeCubit.value = themeModeCubit.value == ThemeMode.light
            ? ThemeMode.dark
            : ThemeMode.light;
      },
      icon: Icon(
        themeModeCubit.value == ThemeMode.light
            ? Icons.dark_mode_outlined
            : Icons.light_mode_outlined,
        size: 24,
      ),
    );
  }
}

class BasicButtonsWidget extends StatelessWidget {
  final upButtonCubit;
  const BasicButtonsWidget({
    required this.upButtonCubit,
  });

  @override
  Widget build(BuildContext context) {
    final processCubit = context.read<ProcessCubit>();
    final resultCubit = context.read<ResultCubit>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilledButtonWidget(
              func: () {
                processCubit.addtoProcess("C");
                resultCubit.addtoProcess("C");
              },
              isBigButton: true,
              child: const Text(
                "C",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            FilledButtonWidget(
              func: () {
                
                if (processCubit.pastProcessList.isNotEmpty) {
                  processCubit.addtoProcess("<-");
                  resultCubit.addtoProcess("<-");
                }
              },
              isBigButton: true,
              child: const Icon(FontAwesome.left_long_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {
                processCubit.addtoProcess("\u0025");
                resultCubit.addtoProcess("\u0025");
              },
              isBigButton: true,
              child: const Icon(FontAwesome.percent_solid, size: 20),
            ),
            FilledButtonTonalWidget(
              func: () {
                processCubit.addtoProcess("\u00F7");
                resultCubit.addtoProcess("\u00F7");
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
                processCubit.addtoProcess("7");
                resultCubit.addtoProcess("7");
              },
              isBigButton: true,
              child: const Text("7", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {
                processCubit.addtoProcess("8");
                resultCubit.addtoProcess("8");
              },
              isBigButton: true,
              child: const Text("8", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {
                processCubit.addtoProcess("9");
                resultCubit.addtoProcess("9");
              },
              isBigButton: true,
              child: const Text("9", style: TextStyle(fontSize: 28)),
            ),
            FilledButtonTonalWidget(
              func: () {
                processCubit.addtoProcess("\u00D7");
                resultCubit.addtoProcess("\u00D7");
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
                processCubit.addtoProcess("4");
                resultCubit.addtoProcess("4");
              },
              isBigButton: true,
              child: const Text("4", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {
                processCubit.addtoProcess("5");
                resultCubit.addtoProcess("5");
              },
              isBigButton: true,
              child: const Text("5", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {
                processCubit.addtoProcess("6");
                resultCubit.addtoProcess("6");
              },
              isBigButton: true,
              child: const Text("6", style: TextStyle(fontSize: 28)),
            ),
            FilledButtonTonalWidget(
              func: () {
                processCubit.addtoProcess("\u2212");
                resultCubit.addtoProcess("\u2212");
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
                processCubit.addtoProcess("1");
                resultCubit.addtoProcess("1");
              },
              isBigButton: true,
              child: const Text("1", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {
                processCubit.addtoProcess("2");
                resultCubit.addtoProcess("2");
              },
              isBigButton: true,
              child: const Text("2", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {
                processCubit.addtoProcess("3");
                resultCubit.addtoProcess("3");
              },
              isBigButton: true,
              child: const Text("3", style: TextStyle(fontSize: 28)),
            ),
            FilledButtonTonalWidget(
              func: () {
                processCubit.addtoProcess("\u002B");
                resultCubit.addtoProcess("\u002B");
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
                resultCubit.addtoProcess("ö");
                resultCubit.addtoProcess("=");
              },
              isBigButton: true,
              child: const Icon(FontAwesome.plus_minus_solid, size: 20),
            ),
            TextButtonWidget(
              func: () {
                processCubit.addtoProcess("0");
                resultCubit.addtoProcess("0");
              },
              isBigButton: true,
              child: const Text("0", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {
                if (!upButtonCubit.value) {
                  processCubit.addtoProcess(",");
                  resultCubit.addtoProcess(",");
                }
              },
              isBigButton: true,
              child: const Text(",", style: TextStyle(fontSize: 28)),
            ),
            FilledButtonWidget(
              func: () {
                if (processCubit.pastProcessList.isNotEmpty) {
                  resultCubit.addtoProcess("=");
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
  final upButtonCubit;
  final changeButtonCubit;

  const SciButtonsWidget({
    required this.upButtonCubit,
    required this.changeButtonCubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final processCubit = context.read<ProcessCubit>();
    final resultCubit = context.read<ResultCubit>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilledButtonWidget(
              func: () {
                processCubit.addtoProcess("C");
                resultCubit.addtoProcess("C");
              },
              child: const Text(
                "C",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            FilledButtonWidget(
              func: () {
                if (processCubit.pastProcessList.isNotEmpty) {
                  processCubit.addtoProcess("<-");
                  resultCubit.addtoProcess("<-");
                }
              },
              child: const Icon(FontAwesome.left_long_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {
                processCubit.addtoProcess("\u0025");
                resultCubit.addtoProcess("\u0025");
              },
              child: const Icon(FontAwesome.percent_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {
                processCubit.addtoProcess("\u00F7");
                resultCubit.addtoProcess("\u00F7");
              },
              child: const Icon(FontAwesome.divide_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {
                processCubit.addtoProcess("\u00D7");
                resultCubit.addtoProcess("\u00D7");
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
                if (upButtonCubit.value) {
                  processCubit.addtoProcess("\u2077");
                  resultCubit.addtoProcess("\u2077");
                } else {
                  processCubit.addtoProcess("7");
                  resultCubit.addtoProcess("7");
                }
              },
              child: const SpecialTextWidget(text: "7"),
            ),
            TextButtonWidget(
              func: () {
                if (upButtonCubit.value) {
                  processCubit.addtoProcess("\u2078");
                  resultCubit.addtoProcess("\u2078");
                } else {
                  processCubit.addtoProcess("8");
                  resultCubit.addtoProcess("8");
                }
              },
              child: const SpecialTextWidget(text: "8"),
            ),
            TextButtonWidget(
              func: () {
                if (upButtonCubit.value) {
                  processCubit.addtoProcess("\u2079");
                  resultCubit.addtoProcess("\u2079");
                } else {
                  processCubit.addtoProcess("9");
                  resultCubit.addtoProcess("9");
                }
              },
              child: const SpecialTextWidget(text: "9"),
            ),
            FilledButtonTonalWidget(
              func: () {
                processCubit.addtoProcess("\u2212");
                resultCubit.addtoProcess("\u2212");
              },
              child: const Icon(FontAwesome.minus_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {
                processCubit.addtoProcess("\u002B");
                resultCubit.addtoProcess("\u002B");
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
                if (upButtonCubit.value) {
                  processCubit.addtoProcess("\u2074");
                  resultCubit.addtoProcess("\u2074");
                } else {
                  processCubit.addtoProcess("4");
                  resultCubit.addtoProcess("4");
                }
              },
              child: const SpecialTextWidget(text: "4"),
            ),
            TextButtonWidget(
              func: () {
                if (upButtonCubit.value) {
                  processCubit.addtoProcess("\u2075");
                  resultCubit.addtoProcess("\u2075");
                } else {
                  processCubit.addtoProcess("5");
                  resultCubit.addtoProcess("5");
                }
              },
              child: const SpecialTextWidget(text: "5"),
            ),
            TextButtonWidget(
              func: () {
                if (upButtonCubit.value) {
                  processCubit.addtoProcess("\u2076");
                  resultCubit.addtoProcess("\u2076");
                } else {
                  processCubit.addtoProcess("6");
                  resultCubit.addtoProcess("6");
                }
              },
              child: const SpecialTextWidget(text: "6"),
            ),
            FilledButtonTonalWidget(
              func: () {
                processCubit.addtoProcess("\u221A(");
                resultCubit.addtoProcess("\u221A(");
                parenthesesCount++;
              },
              child: const Icon(
                FontAwesome.square_root_variable_solid,
                size: 16,
              ),
            ),
            FilledButtonTonalWidget(
              func: () {
                processCubit.addtoProcess("\u00B2");
                resultCubit.addtoProcess("q");
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
                if (upButtonCubit.value) {
                  processCubit.addtoProcess("\u00B9");
                  resultCubit.addtoProcess("\u00B9");
                } else {
                  processCubit.addtoProcess("1");
                  resultCubit.addtoProcess("1");
                }
              },
              child: const SpecialTextWidget(text: "1"),
            ),
            TextButtonWidget(
              func: () {
                if (upButtonCubit.value) {
                  processCubit.addtoProcess("\u00B2");
                  resultCubit.addtoProcess("\u00B2");
                } else {
                  processCubit.addtoProcess("2");
                  resultCubit.addtoProcess("2");
                }
              },
              child: const SpecialTextWidget(text: "2"),
            ),
            TextButtonWidget(
              func: () {
                if (upButtonCubit.value) {
                  processCubit.addtoProcess("\u00B3");
                  resultCubit.addtoProcess("\u00B3");
                } else {
                  processCubit.addtoProcess("3");
                  resultCubit.addtoProcess("3");
                }
              },
              child: const SpecialTextWidget(text: "3"),
            ),
            FilledButtonTonalWidget(
              isSelected: upButtonCubit.value,
              func: () {
                if (processCubit.pastProcessList.isNotEmpty) {
                  upButtonCubit.value = !upButtonCubit.value;
                  upButtonCubit.value
                      ? resultCubit.addtoProcess("wğ")
                      : resultCubit.addtoProcess("ü");
                }
              },
              child: SpecialFilledTextWidget(
                text: "^",
                isSelected: upButtonCubit.value,
              ),
            ),
            FilledButtonTonalWidget(
              func: () {
                resultCubit.addtoProcess("()");
                processCubit.addtoProcess("()");
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
                resultCubit.addtoProcess("ö");
                resultCubit.addtoProcess("=");
              },
              child: const Icon(FontAwesome.plus_minus_solid, size: 16),
            ),
            TextButtonWidget(
              func: () {
                if (upButtonCubit.value) {
                  processCubit.addtoProcess("\u2070");
                  resultCubit.addtoProcess("\u2070");
                } else {
                  processCubit.addtoProcess("0");
                  resultCubit.addtoProcess("0");
                }
              },
              child: const SpecialTextWidget(text: "0"),
            ),
            TextButtonWidget(
              func: () {
                if (!upButtonCubit.value) {
                  processCubit.addtoProcess(",");
                  resultCubit.addtoProcess(",");
                }
              },
              child: const SpecialTextWidget(text: ","),
            ),
            FilledButtonTonalWidget(
              func: () {
                processCubit.addtoProcess("rad(");
                resultCubit.addtoProcess("rad(");
                parenthesesCount++;
              },
              child: const SpecialFilledTextWidget(text: "Rad"),
            ),
            FilledButtonTonalWidget(
              func: () {
                changeButtonCubit.value = !changeButtonCubit.value;
              },
              isSelected: changeButtonCubit.value,
              child: Icon(
                FontAwesome.right_left_solid,
                size: 14,
                color: changeButtonCubit.value
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
                changeButtonCubit.value
                    ? {
                        processCubit.addtoProcess("arcsin("),
                        resultCubit.addtoProcess("arcsin("),
                      }
                    : {
                        processCubit.addtoProcess("sin("),
                        resultCubit.addtoProcess("sin("),
                      };
                parenthesesCount++;
              },
              isSelected: changeButtonCubit.value,
              child: SpecialFilledTextWidget(
                text: "sin",
                isSelected: changeButtonCubit.value,
              ),
            ),
            FilledButtonTonalWidget(
              func: () {
                changeButtonCubit.value
                    ? {
                        processCubit.addtoProcess("arccos("),
                        resultCubit.addtoProcess("arccos(")
                      }
                    : {
                        processCubit.addtoProcess("cos("),
                        resultCubit.addtoProcess("cos(")
                      };
                parenthesesCount++;
              },
              isSelected: changeButtonCubit.value,
              child: SpecialFilledTextWidget(
                text: "cos",
                isSelected: changeButtonCubit.value,
              ),
            ),
            FilledButtonTonalWidget(
              func: () {
                changeButtonCubit.value
                    ? {
                        processCubit.addtoProcess("arctan("),
                        resultCubit.addtoProcess("arctan("),
                      }
                    : {
                        processCubit.addtoProcess("tan("),
                        resultCubit.addtoProcess("tan("),
                      };
                parenthesesCount++;
              },
              isSelected: changeButtonCubit.value,
              child: SpecialFilledTextWidget(
                text: "tan",
                isSelected: changeButtonCubit.value,
              ),
            ),
            FilledButtonTonalWidget(
              func: () {
                resultCubit.addtoProcess("π");
                processCubit.addtoProcess("π");
              },
              child: const SpecialFilledTextWidget(text: "π"),
            ),
            FilledButtonTonalWidget(
              func: () {
                resultCubit.addtoProcess("e");
                processCubit.addtoProcess("e");
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
                resultCubit.addtoProcess("ln(");
                processCubit.addtoProcess("ln(");
                parenthesesCount++;
              },
              child: const SpecialFilledTextWidget(text: "ln"),
            ),
            FilledButtonTonalWidget(
              func: () {
                resultCubit.addtoProcess("log(");
                processCubit.addtoProcess("log(");
                parenthesesCount++;
              },
              child: const SpecialFilledTextWidget(text: "log"),
            ),
            FilledButtonTonalWidget(
              func: () {
                resultCubit.addtoProcess("1/x");
                processCubit.addtoProcess("1/x");
              },
              child: const SpecialFilledTextWidget(text: "1/x"),
            ),
            FilledButtonTonalWidget(
              func: () {
                resultCubit.addtoProcess("abs(");
                processCubit.addtoProcess("abs(");
                parenthesesCount++;
              },
              child: const SpecialFilledTextWidget(text: "|x|"),
            ),
            FilledButtonWidget(
              func: () {
                if (upButtonCubit.value) {
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
                } else if (processCubit
                    .pastProcessList
                    .isNotEmpty) {
                  resultCubit.addtoProcess("=");
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
  Widget build(BuildContext context){
      return SizedBox(
      height: size.height / 3,
      width: size.width,
      child: BlocBuilder<GarbageCollactorCubit, Map<String, String>>(
        builder: (context, state){
          return Stack(
        children: [
          state.isEmpty
              ? Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Nothing here!",
                    style: MyTextTheme.modalBottomSheetStyle(context),
                  ),
                )
              : ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    return PastItemWidget(
                      proces: state
                          .keys
                          .toList()[index],
                      result: state
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
                state.clear();
                context.read<ResultCubit>().addtoProcess("C");
                context.read<ProcessCubit>().addtoProcess("C");
                Navigator.pop(context);
              },
            ),
          ),
        ],
      );
        },
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
