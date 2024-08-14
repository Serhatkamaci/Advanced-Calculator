import 'package:advanced_calculator/src/controller/garbage_controller.dart';
import 'package:advanced_calculator/src/controller/general_variable.dart';
import 'package:advanced_calculator/src/controller/process_controller.dart';
import 'package:advanced_calculator/src/controller/result_controller.dart';
import 'package:advanced_calculator/core/button_styles.dart';
import 'package:advanced_calculator/core/text_styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

class ProcessTextWidget extends GetView<ProcessController> {
  const ProcessTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AutoSizeText(
        controller.procesString.value,
        style: MyTextTheme.processStyle(context),
        textAlign: TextAlign.end,
        minFontSize: 20,
        maxFontSize: 44,
      );
    });
  }
}

class ResultTextWidget extends GetView<ResultController> {
  const ResultTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return AutoSizeText(
          controller.showtoScreenResultValue.value.length > 7
              ? double.parse(controller.showtoScreenResultValue.value)
                  .toStringAsExponential(7)
              : controller.showtoScreenResultValue.value,
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
  const ButtonsWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      height: size.height / 2,
      child: Obx(
        () => AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: calculatorModeVariable.value
              ? BasicButtonsWidget()
              : SciButtonsWidget(),
        ),
      ),
    );
  }
}

class CalculatorModeButtonWidget extends StatelessWidget {
  const CalculatorModeButtonWidget({
    super.key,
  });

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
  const ThemeModeButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IconButton(
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
      ),
    );
  }
}

// ignore: must_be_immutable
class BasicButtonsWidget extends StatelessWidget {
  BasicButtonsWidget({
    super.key,
  });

  var processController = Get.find<ProcessController>();
  var resultController = Get.find<ResultController>();

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
                processController.addtoProcess("C");
                resultController.addtoProcess("C");
              },
              isBigButton: true,
              child: const Text(
                "C",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            FilledButtonWidget(
              func: () {
                if (processController.pastProcessList.isNotEmpty) {
                  processController.addtoProcess("<-");
                  resultController.addtoProcess("<-");
                }
              },
              isBigButton: true,
              child: const Icon(FontAwesome.left_long_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {
                processController.addtoProcess("\u0025");
                resultController.addtoProcess("\u0025");
              },
              isBigButton: true,
              child: const Icon(FontAwesome.percent_solid, size: 20),
            ),
            FilledButtonTonalWidget(
              func: () {
                processController.addtoProcess("\u00F7");
                resultController.addtoProcess("\u00F7");
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
                processController.addtoProcess("7");
                resultController.addtoProcess("7");
              },
              isBigButton: true,
              child: const Text("7", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {
                processController.addtoProcess("8");
                resultController.addtoProcess("8");
              },
              isBigButton: true,
              child: const Text("8", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {
                processController.addtoProcess("9");
                resultController.addtoProcess("9");
              },
              isBigButton: true,
              child: const Text("9", style: TextStyle(fontSize: 28)),
            ),
            FilledButtonTonalWidget(
              func: () {
                processController.addtoProcess("\u00D7");
                resultController.addtoProcess("\u00D7");
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
                processController.addtoProcess("4");
                resultController.addtoProcess("4");
              },
              isBigButton: true,
              child: const Text("4", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {
                processController.addtoProcess("5");
                resultController.addtoProcess("5");
              },
              isBigButton: true,
              child: const Text("5", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {
                processController.addtoProcess("6");
                resultController.addtoProcess("6");
              },
              isBigButton: true,
              child: const Text("6", style: TextStyle(fontSize: 28)),
            ),
            FilledButtonTonalWidget(
              func: () {
                processController.addtoProcess("\u2212");
                resultController.addtoProcess("\u2212");
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
                processController.addtoProcess("1");
                resultController.addtoProcess("1");
              },
              isBigButton: true,
              child: const Text("1", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {
                processController.addtoProcess("2");
                resultController.addtoProcess("2");
              },
              isBigButton: true,
              child: const Text("2", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {
                processController.addtoProcess("3");
                resultController.addtoProcess("3");
              },
              isBigButton: true,
              child: const Text("3", style: TextStyle(fontSize: 28)),
            ),
            FilledButtonTonalWidget(
              func: () {
                processController.addtoProcess("\u002B");
                resultController.addtoProcess("\u002B");
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
                resultController.addtoProcess("ö");
                resultController.addtoProcess("=");
              },
              isBigButton: true,
              child: const Icon(FontAwesome.plus_minus_solid, size: 20),
            ),
            TextButtonWidget(
              func: () {
                processController.addtoProcess("0");
                resultController.addtoProcess("0");
              },
              isBigButton: true,
              child: const Text("0", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {
                if (!upButtonVariable.value) {
                  processController.addtoProcess(",");
                  resultController.addtoProcess(",");
                }
              },
              isBigButton: true,
              child: const Text(",", style: TextStyle(fontSize: 28)),
            ),
            FilledButtonWidget(
              func: () {
                if (processController.pastProcessList.isNotEmpty) {
                  resultController.addtoProcess("=");
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

// ignore: must_be_immutable
class SciButtonsWidget extends StatelessWidget {
  SciButtonsWidget({
    super.key,
  });

  var processController = Get.find<ProcessController>();
  var resultController = Get.find<ResultController>();

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
                processController.addtoProcess("C");
                resultController.addtoProcess("C");
              },
              child: const Text(
                "C",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            FilledButtonWidget(
              func: () {
                if (processController.pastProcessList.isNotEmpty) {
                  processController.addtoProcess("<-");
                  resultController.addtoProcess("<-");
                }
              },
              child: const Icon(FontAwesome.left_long_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {
                processController.addtoProcess("\u0025");
                resultController.addtoProcess("\u0025");
              },
              child: const Icon(FontAwesome.percent_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {
                processController.addtoProcess("\u00F7");
                resultController.addtoProcess("\u00F7");
              },
              child: const Icon(FontAwesome.divide_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {
                processController.addtoProcess("\u00D7");
                resultController.addtoProcess("\u00D7");
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
                  processController.addtoProcess("\u2077");
                  resultController.addtoProcess("\u2077");
                } else {
                  processController.addtoProcess("7");
                  resultController.addtoProcess("7");
                }
              },
              child: const SpecialTextWidget(text: "7"),
            ),
            TextButtonWidget(
              func: () {
                if (upButtonVariable.value) {
                  processController.addtoProcess("\u2078");
                  resultController.addtoProcess("\u2078");
                } else {
                  processController.addtoProcess("8");
                  resultController.addtoProcess("8");
                }
              },
              child: const SpecialTextWidget(text: "8"),
            ),
            TextButtonWidget(
              func: () {
                if (upButtonVariable.value) {
                  processController.addtoProcess("\u2079");
                  resultController.addtoProcess("\u2079");
                } else {
                  processController.addtoProcess("9");
                  resultController.addtoProcess("9");
                }
              },
              child: const SpecialTextWidget(text: "9"),
            ),
            FilledButtonTonalWidget(
              func: () {
                processController.addtoProcess("\u2212");
                resultController.addtoProcess("\u2212");
              },
              child: const Icon(FontAwesome.minus_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {
                processController.addtoProcess("\u002B");
                resultController.addtoProcess("\u002B");
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
                  processController.addtoProcess("\u2074");
                  resultController.addtoProcess("\u2074");
                } else {
                  processController.addtoProcess("4");
                  resultController.addtoProcess("4");
                }
              },
              child: const SpecialTextWidget(text: "4"),
            ),
            TextButtonWidget(
              func: () {
                if (upButtonVariable.value) {
                  processController.addtoProcess("\u2075");
                  resultController.addtoProcess("\u2075");
                } else {
                  processController.addtoProcess("5");
                  resultController.addtoProcess("5");
                }
              },
              child: const SpecialTextWidget(text: "5"),
            ),
            TextButtonWidget(
              func: () {
                if (upButtonVariable.value) {
                  processController.addtoProcess("\u2076");
                  resultController.addtoProcess("\u2076");
                } else {
                  processController.addtoProcess("6");
                  resultController.addtoProcess("6");
                }
              },
              child: const SpecialTextWidget(text: "6"),
            ),
            FilledButtonTonalWidget(
              func: () {
                processController.addtoProcess("\u221A(");
                resultController.addtoProcess("\u221A(");
                parenthesesCount++;
              },
              child: const Icon(
                FontAwesome.square_root_variable_solid,
                size: 16,
              ),
            ),
            FilledButtonTonalWidget(
              func: () {
                processController.addtoProcess("\u00B2");
                resultController.addtoProcess("q");
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
                  processController.addtoProcess("\u00B9");
                  resultController.addtoProcess("\u00B9");
                } else {
                  processController.addtoProcess("1");
                  resultController.addtoProcess("1");
                }
              },
              child: const SpecialTextWidget(text: "1"),
            ),
            TextButtonWidget(
              func: () {
                if (upButtonVariable.value) {
                  processController.addtoProcess("\u00B2");
                  resultController.addtoProcess("\u00B2");
                } else {
                  processController.addtoProcess("2");
                  resultController.addtoProcess("2");
                }
              },
              child: const SpecialTextWidget(text: "2"),
            ),
            TextButtonWidget(
              func: () {
                if (upButtonVariable.value) {
                  processController.addtoProcess("\u00B3");
                  resultController.addtoProcess("\u00B3");
                } else {
                  processController.addtoProcess("3");
                  resultController.addtoProcess("3");
                }
              },
              child: const SpecialTextWidget(text: "3"),
            ),
            Obx(
              () => FilledButtonTonalWidget(
                isSelected: upButtonVariable.value,
                func: () {
                  if (processController.pastProcessList.isNotEmpty) {
                    upButtonVariable.value = !upButtonVariable.value;
                    upButtonVariable.value
                        ? resultController.addtoProcess("wğ")
                        : resultController.addtoProcess("ü");
                  }
                },
                child: SpecialFilledTextWidget(
                  text: "^",
                  isSelected: upButtonVariable.value,
                ),
              ),
            ),
            FilledButtonTonalWidget(
              func: () {
                resultController.addtoProcess("()");
                processController.addtoProcess("()");
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
                resultController.addtoProcess("ö");
                resultController.addtoProcess("=");
              },
              child: const Icon(FontAwesome.plus_minus_solid, size: 16),
            ),
            TextButtonWidget(
              func: () {
                if (upButtonVariable.value) {
                  processController.addtoProcess("\u2070");
                  resultController.addtoProcess("\u2070");
                } else {
                  processController.addtoProcess("0");
                  resultController.addtoProcess("0");
                }
              },
              child: const SpecialTextWidget(text: "0"),
            ),
            TextButtonWidget(
              func: () {
                if (!upButtonVariable.value) {
                  processController.addtoProcess(",");
                  resultController.addtoProcess(",");
                }
              },
              child: const SpecialTextWidget(text: ","),
            ),
            FilledButtonTonalWidget(
              func: () {
                processController.addtoProcess("rad(");
                resultController.addtoProcess("rad(");
                parenthesesCount++;
              },
              child: const SpecialFilledTextWidget(text: "Rad"),
            ),
            Obx(
              () => FilledButtonTonalWidget(
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
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => FilledButtonTonalWidget(
                func: () {
                  changeButtonVariable.value
                      ? {
                          processController.addtoProcess("arcsin("),
                          resultController.addtoProcess("arcsin("),
                        }
                      : {
                          processController.addtoProcess("sin("),
                          resultController.addtoProcess("sin("),
                        };
                  parenthesesCount++;
                },
                isSelected: changeButtonVariable.value,
                child: SpecialFilledTextWidget(
                  text: "sin",
                  isSelected: changeButtonVariable.value,
                ),
              ),
            ),
            Obx(
              () => FilledButtonTonalWidget(
                func: () {
                  changeButtonVariable.value
                      ? {
                          processController.addtoProcess("arccos("),
                          resultController.addtoProcess("arccos("),
                        }
                      : {
                          processController.addtoProcess("cos("),
                          resultController.addtoProcess("cos("),
                        };
                  parenthesesCount++;
                },
                isSelected: changeButtonVariable.value,
                child: SpecialFilledTextWidget(
                  text: "cos",
                  isSelected: changeButtonVariable.value,
                ),
              ),
            ),
            Obx(
              () => FilledButtonTonalWidget(
                func: () {
                  changeButtonVariable.value
                      ? {
                          processController.addtoProcess("arctan("),
                          resultController.addtoProcess("arctan("),
                        }
                      : {
                          processController.addtoProcess("tan("),
                          resultController.addtoProcess("tan("),
                        };
                  parenthesesCount++;
                },
                isSelected: changeButtonVariable.value,
                child: SpecialFilledTextWidget(
                  text: "tan",
                  isSelected: changeButtonVariable.value,
                ),
              ),
            ),
            FilledButtonTonalWidget(
              func: () {
                resultController.addtoProcess("π");
                processController.addtoProcess("π");
              },
              child: const SpecialFilledTextWidget(text: "π"),
            ),
            FilledButtonTonalWidget(
              func: () {
                resultController.addtoProcess("e");
                processController.addtoProcess("e");
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
                resultController.addtoProcess("ln(");
                processController.addtoProcess("ln(");
                parenthesesCount++;
              },
              child: const SpecialFilledTextWidget(text: "ln"),
            ),
            FilledButtonTonalWidget(
              func: () {
                resultController.addtoProcess("log(");
                processController.addtoProcess("log(");
                parenthesesCount++;
              },
              child: const SpecialFilledTextWidget(text: "log"),
            ),
            FilledButtonTonalWidget(
              func: () {
                resultController.addtoProcess("1/x");
                processController.addtoProcess("1/x");
              },
              child: const SpecialFilledTextWidget(text: "1/x"),
            ),
            FilledButtonTonalWidget(
              func: () {
                resultController.addtoProcess("abs(");
                processController.addtoProcess("abs(");
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
                } else if (processController.pastProcessList.isNotEmpty) {
                  resultController.addtoProcess("=");
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

// ignore: must_be_immutable
class BottomSheetWidget extends StatelessWidget {
  final Size size;
  BottomSheetWidget({super.key, required this.size});

  var garbageController = Get.find<GarbageController>();
  var processController = Get.find<ProcessController>();
  var resultController = Get.find<ResultController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3,
      width: size.width,
      child: Stack(
        children: [
          garbageController.garbage.isEmpty
              ? Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Nothing here!",
                    style: MyTextTheme.modalBottomSheetStyle(context),
                  ),
                )
              : ListView.builder(
                  itemCount: garbageController.garbage.length,
                  itemBuilder: (context, index) {
                    return PastItemWidget(
                      proces: garbageController.garbage.keys.toList()[index],
                      result: garbageController.garbage.values.toList()[index],
                    );
                  },
                ),
          Positioned(
            bottom: 16,
            left: 16,
            child: IconButton.filledTonal(
              icon: const Icon(FontAwesome.trash_solid, size: 16),
              onPressed: () {
                garbageController.garbage.clear();
                resultController.addtoProcess("C");
                processController.addtoProcess("C");
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
