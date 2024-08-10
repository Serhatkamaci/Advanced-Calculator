import 'package:advanced_calculator/core/button_styles.dart';
import 'package:advanced_calculator/core/text_styles.dart';
import 'package:advanced_calculator/src/business_logic/provider/garbage_collactor_provider.dart';
import 'package:advanced_calculator/src/business_logic/provider/process_provider.dart';
import 'package:advanced_calculator/src/business_logic/provider/result_provider.dart';
import 'package:advanced_calculator/src/view/screen/calculator_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

//? Texts

class ProcessTextWidget extends ConsumerWidget {
  const ProcessTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoSizeText(
      ref.watch(processProvider).readtoProcess(),
      style: MyTextTheme.processStyle(context),
      textAlign: TextAlign.end,
      maxLines: 3,
      minFontSize: 30,
      maxFontSize: 44,
    );
  }
}

class ResultTextWidget extends ConsumerWidget {
  const ResultTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoSizeText(
      ref.watch(resulProvider).readtoProcessResult(),
      style: const TextStyle(fontSize: 56),
      maxLines: 1,
      minFontSize: 30,
      overflow: TextOverflow.clip,
      textAlign: TextAlign.end,
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

class ButtonsWidget extends ConsumerWidget {
  const ButtonsWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      height: size.height / 2,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: ref.watch(calculatorModeProvider)
            ? const BasicButtonsWidget()
            : const SciButtonsWidget(),
      ),
    );
  }
}

class CalculatorModeButtonWidget extends ConsumerWidget {
  const CalculatorModeButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        ref.read(calculatorModeProvider.notifier).state =
            !ref.watch(calculatorModeProvider);
      },
      icon: const Icon(FontAwesome.vial_solid, size: 16),
    );
  }
}

class ThemeModeButtonWidget extends ConsumerWidget {
  const ThemeModeButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: IconButton(
        onPressed: () {
          ref.read(themeModeProvider.notifier).state =
              ref.watch(themeModeProvider) == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light;
        },
        icon: const Icon(Icons.dark_mode_outlined, size: 24),
      ),
    );
  }
}

//? Lists

class BasicButtonsWidget extends StatelessWidget {
  const BasicButtonsWidget({
    super.key,
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
              func: () {},
              isBigButton: true,
              child: const Text(
                "C",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            FilledButtonWidget(
              func: () {},
              isBigButton: true,
              child: const Icon(FontAwesome.left_long_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {},
              isBigButton: true,
              child: const Icon(FontAwesome.percent_solid, size: 20),
            ),
            FilledButtonTonalWidget(
              func: () {},
              isBigButton: true,
              child: const Icon(FontAwesome.divide_solid, size: 20),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButtonWidget(
              func: () {},
              isBigButton: true,
              child: const Text("7", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {},
              isBigButton: true,
              child: const Text("8", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {},
              isBigButton: true,
              child: const Text("9", style: TextStyle(fontSize: 28)),
            ),
            FilledButtonTonalWidget(
              func: () {},
              isBigButton: true,
              child: const Icon(FontAwesome.xmark_solid, size: 20),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButtonWidget(
              func: () {},
              isBigButton: true,
              child: const Text("4", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {},
              isBigButton: true,
              child: const Text("5", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {},
              isBigButton: true,
              child: const Text("6", style: TextStyle(fontSize: 28)),
            ),
            FilledButtonTonalWidget(
              func: () {},
              isBigButton: true,
              child: const Icon(FontAwesome.minus_solid, size: 20),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButtonWidget(
              func: () {},
              isBigButton: true,
              child: const Text("1", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {},
              isBigButton: true,
              child: const Text("2", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {},
              isBigButton: true,
              child: const Text("3", style: TextStyle(fontSize: 28)),
            ),
            FilledButtonTonalWidget(
              func: () {},
              isBigButton: true,
              child: const Icon(FontAwesome.plus_solid, size: 20),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButtonWidget(
              func: () {},
              isBigButton: true,
              child: const Icon(FontAwesome.plus_minus_solid, size: 20),
            ),
            TextButtonWidget(
              func: () {},
              isBigButton: true,
              child: const Text("0", style: TextStyle(fontSize: 28)),
            ),
            TextButtonWidget(
              func: () {},
              isBigButton: true,
              child: const Text(",", style: TextStyle(fontSize: 28)),
            ),
            FilledButtonWidget(
              func: () {},
              isBigButton: true,
              child: const Icon(FontAwesome.equals_solid, size: 20),
            ),
          ],
        ),
      ],
    );
  }
}

final upButtonProvider = StateProvider((ref) => false);
final changeButtonProvider = StateProvider((ref) => false);

class SciButtonsWidget extends ConsumerWidget {
  const SciButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilledButtonWidget(
              func: () {
                ref.read(processProvider).addtoProcess("C");
                ref.read(resulProvider).addtoProcess("C");
              },
              child: const Text(
                "C",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            FilledButtonWidget(
              func: () {
                if (ref.watch(processProvider).pastProcessList.isNotEmpty) {
                  ref.read(processProvider).addtoProcess("<-");
                  ref.read(resulProvider).addtoProcess("<-");
                }
              },
              child: const Icon(FontAwesome.left_long_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {
                ref.read(processProvider).addtoProcess("\u0025");
                ref.read(resulProvider).addtoProcess("\u0025");
              },
              child: const Icon(FontAwesome.percent_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {
                ref.read(processProvider).addtoProcess("\u00F7");
                ref.read(resulProvider).addtoProcess("\u00F7");
              },
              child: const Icon(FontAwesome.divide_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {
                ref.read(processProvider).addtoProcess("\u00D7");
                ref.read(resulProvider).addtoProcess("\u00D7");
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
                if (ref.watch(upButtonProvider)) {
                  ref.read(processProvider).addtoProcess("\u2077");
                  ref.read(resulProvider).addtoProcess("\u2077");
                } else {
                  ref.read(processProvider).addtoProcess("7");
                  ref.read(resulProvider).addtoProcess("7");
                }
              },
              child: const SpecialTextWidget(text: "7"),
            ),
            TextButtonWidget(
              func: () {
                if (ref.watch(upButtonProvider)) {
                  ref.read(processProvider).addtoProcess("\u2078");
                  ref.read(resulProvider).addtoProcess("\u2078");
                } else {
                  ref.read(processProvider).addtoProcess("8");
                  ref.read(resulProvider).addtoProcess("8");
                }
              },
              child: const SpecialTextWidget(text: "8"),
            ),
            TextButtonWidget(
              func: () {
                if (ref.watch(upButtonProvider)) {
                  ref.read(processProvider).addtoProcess("\u2079");
                  ref.read(resulProvider).addtoProcess("\u2079");
                } else {
                  ref.read(processProvider).addtoProcess("9");
                  ref.read(resulProvider).addtoProcess("9");
                }
              },
              child: const SpecialTextWidget(text: "9"),
            ),
            FilledButtonTonalWidget(
              func: () {
                ref.read(processProvider).addtoProcess("\u2212");
                ref.read(resulProvider).addtoProcess("\u2212");
              },
              child: const Icon(FontAwesome.minus_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {
                ref.read(processProvider).addtoProcess("\u002B");
                ref.read(resulProvider).addtoProcess("\u002B");
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
                if (ref.watch(upButtonProvider)) {
                  ref.read(processProvider).addtoProcess("\u2074");
                  ref.read(resulProvider).addtoProcess("\u2074");
                } else {
                  ref.read(processProvider).addtoProcess("4");
                  ref.read(resulProvider).addtoProcess("4");
                }
              },
              child: const SpecialTextWidget(text: "4"),
            ),
            TextButtonWidget(
              func: () {
                if (ref.watch(upButtonProvider)) {
                  ref.read(processProvider).addtoProcess("\u2075");
                  ref.read(resulProvider).addtoProcess("\u2075");
                } else {
                  ref.read(processProvider).addtoProcess("5");
                  ref.read(resulProvider).addtoProcess("5");
                }
              },
              child: const SpecialTextWidget(text: "5"),
            ),
            TextButtonWidget(
              func: () {
                if (ref.watch(upButtonProvider)) {
                  ref.read(processProvider).addtoProcess("\u2076");
                  ref.read(resulProvider).addtoProcess("\u2076");
                } else {
                  ref.read(processProvider).addtoProcess("6");
                  ref.read(resulProvider).addtoProcess("6");
                }
              },
              child: const SpecialTextWidget(text: "6"),
            ),
            FilledButtonTonalWidget(
              func: () {
                ref.read(processProvider).addtoProcess("\u221A(");
                ref.read(resulProvider).addtoProcess("\u221A(");
                parenthesesCount++;
              },
              child: const Icon(
                FontAwesome.square_root_variable_solid,
                size: 16,
              ),
            ),
            FilledButtonTonalWidget(
              func: () {
                ref.read(processProvider).addtoProcess("\u00B2");
                ref.read(resulProvider).addtoProcess("q");
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
                if (ref.watch(upButtonProvider)) {
                  ref.read(processProvider).addtoProcess("\u00B9");
                  ref.read(resulProvider).addtoProcess("\u00B9");
                } else {
                  ref.read(processProvider).addtoProcess("1");
                  ref.read(resulProvider).addtoProcess("1");
                }
              },
              child: const SpecialTextWidget(text: "1"),
            ),
            TextButtonWidget(
              func: () {
                if (ref.watch(upButtonProvider)) {
                  ref.read(processProvider).addtoProcess("\u00B2");
                  ref.read(resulProvider).addtoProcess("\u00B2");
                } else {
                  ref.read(processProvider).addtoProcess("2");
                  ref.read(resulProvider).addtoProcess("2");
                }
              },
              child: const SpecialTextWidget(text: "2"),
            ),
            TextButtonWidget(
              func: () {
                if (ref.watch(upButtonProvider)) {
                  ref.read(processProvider).addtoProcess("\u00B3");
                  ref.read(resulProvider).addtoProcess("\u00B3");
                } else {
                  ref.read(processProvider).addtoProcess("3");
                  ref.read(resulProvider).addtoProcess("3");
                }
              },
              child: const SpecialTextWidget(text: "3"),
            ),
            FilledButtonTonalWidget(
              isSelected: ref.watch(upButtonProvider),
              func: () {
                if (ref.watch(processProvider).pastProcessList.isNotEmpty) {
                  ref.read(upButtonProvider.notifier).state =
                      !ref.watch(upButtonProvider);
                  ref.watch(upButtonProvider)
                      ? ref.read(resulProvider).addtoProcess("wğ")
                      : ref.read(resulProvider).addtoProcess("ü");
                }
              },
              child: SpecialFilledTextWidget(
                text: "^",
                isSelected: ref.watch(upButtonProvider),
              ),
            ),
            FilledButtonTonalWidget(
              func: () {
                ref.read(resulProvider).addtoProcess("()");
                ref.read(processProvider).addtoProcess("()");
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
                ref.read(resulProvider).addtoProcess("ö");
                ref.read(resulProvider).addtoProcess("=");
              },
              child: const Icon(FontAwesome.plus_minus_solid, size: 16),
            ),
            TextButtonWidget(
              func: () {
                if (ref.watch(upButtonProvider)) {
                  ref.read(processProvider).addtoProcess("\u2070");
                  ref.read(resulProvider).addtoProcess("\u2070");
                } else {
                  ref.read(processProvider).addtoProcess("0");
                  ref.read(resulProvider).addtoProcess("0");
                }
              },
              child: const SpecialTextWidget(text: "0"),
            ),
            TextButtonWidget(
              func: () {
                if (!ref.watch(upButtonProvider)) {
                  ref.read(processProvider).addtoProcess(",");
                  ref.read(resulProvider).addtoProcess(",");
                }
              },
              child: const SpecialTextWidget(text: ","),
            ),
            FilledButtonTonalWidget(
              func: () {
                ref.read(processProvider).addtoProcess("rad(");
                ref.read(resulProvider).addtoProcess("rad(");
                parenthesesCount++;
              },
              child: const SpecialFilledTextWidget(text: "Rad"),
            ),
            FilledButtonTonalWidget(
              func: () {
                ref.read(changeButtonProvider.notifier).state =
                    !ref.watch(changeButtonProvider);
              },
              isSelected: ref.watch(changeButtonProvider),
              child: Icon(
                FontAwesome.right_left_solid,
                size: 14,
                color: ref.watch(changeButtonProvider)
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
                ref.watch(changeButtonProvider)
                    ? {
                        ref.read(processProvider).addtoProcess("arcsin("),
                        ref.read(resulProvider).addtoProcess("arcsin("),
                      }
                    : {
                        ref.read(processProvider).addtoProcess("sin("),
                        ref.read(resulProvider).addtoProcess("sin("),
                      };
                parenthesesCount++;
              },
              isSelected: ref.watch(changeButtonProvider),
              child: SpecialFilledTextWidget(
                text: "sin",
                isSelected: ref.watch(changeButtonProvider),
              ),
            ),
            FilledButtonTonalWidget(
              func: () {
                ref.watch(changeButtonProvider)
                    ? {
                        ref.read(processProvider).addtoProcess("arccos("),
                        ref.read(resulProvider).addtoProcess("arccos(")
                      }
                    : {
                        ref.read(processProvider).addtoProcess("cos("),
                        ref.read(resulProvider).addtoProcess("cos(")
                      };
                parenthesesCount++;
              },
              isSelected: ref.watch(changeButtonProvider),
              child: SpecialFilledTextWidget(
                text: "cos",
                isSelected: ref.watch(changeButtonProvider),
              ),
            ),
            FilledButtonTonalWidget(
              func: () {
                ref.watch(changeButtonProvider)
                    ? {
                        ref.read(processProvider).addtoProcess("arctan("),
                        ref.read(resulProvider).addtoProcess("arctan("),
                      }
                    : {
                        ref.read(processProvider).addtoProcess("tan("),
                        ref.read(resulProvider).addtoProcess("tan("),
                      };
                parenthesesCount++;
              },
              isSelected: ref.watch(changeButtonProvider),
              child: SpecialFilledTextWidget(
                text: "tan",
                isSelected: ref.watch(changeButtonProvider),
              ),
            ),
            FilledButtonTonalWidget(
              func: () {
                ref.read(resulProvider).addtoProcess("π");
                ref.read(processProvider).addtoProcess("π");
              },
              child: const SpecialFilledTextWidget(text: "π"),
            ),
            FilledButtonTonalWidget(
              func: () {
                ref.read(resulProvider).addtoProcess("e");
                ref.read(processProvider).addtoProcess("e");
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
                ref.read(resulProvider).addtoProcess("ln(");
                ref.read(processProvider).addtoProcess("ln(");
                parenthesesCount++;
              },
              child: const SpecialFilledTextWidget(text: "ln"),
            ),
            FilledButtonTonalWidget(
              func: () {
                ref.read(resulProvider).addtoProcess("log(");
                ref.read(processProvider).addtoProcess("log(");
                parenthesesCount++;
              },
              child: const SpecialFilledTextWidget(text: "log"),
            ),
            FilledButtonTonalWidget(
              func: () {
                ref.read(resulProvider).addtoProcess("1/x");
                ref.read(processProvider).addtoProcess("1/x");
              },
              child: const SpecialFilledTextWidget(text: "1/x"),
            ),
            FilledButtonTonalWidget(
              func: () {
                ref.read(resulProvider).addtoProcess("abs(");
                ref.read(processProvider).addtoProcess("abs(");
                parenthesesCount++;
              },
              child: const SpecialFilledTextWidget(text: "|x|"),
            ),
            FilledButtonWidget(
              func: () {
                if (ref.watch(upButtonProvider)) {
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
                } else if (ref
                    .watch(processProvider)
                    .pastProcessList
                    .isNotEmpty) {
                  ref.read(resulProvider).addtoProcess("=");
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

class BottomSheetWidget extends ConsumerWidget {
  final Size size;
  const BottomSheetWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: size.height / 3,
      width: size.width,
      child: Stack(
        children: [
          ref.watch(garbageCollactorProvider).garbage.isEmpty
              ? Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Nothing here!",
                    style: MyTextTheme.modalBottomSheetStyle(context),
                  ),
                )
              : ListView.builder(
                  itemCount: ref.watch(garbageCollactorProvider).garbage.length,
                  itemBuilder: (context, index) {
                    return PastItemWidget(
                      proces: ref
                          .watch(garbageCollactorProvider)
                          .garbage
                          .keys
                          .toList()[index],
                      result: ref
                          .watch(garbageCollactorProvider)
                          .garbage
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
                ref.read(garbageCollactorProvider).garbage.clear();
                ref.read(resulProvider).addtoProcess("C");
                ref.read(processProvider).addtoProcess("C");
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
