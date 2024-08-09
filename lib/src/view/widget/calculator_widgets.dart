import 'package:advanced_calculator/core/button_styles.dart';
import 'package:advanced_calculator/core/text_styles.dart';
import 'package:advanced_calculator/src/business_logic/provider/process_provider.dart';
import 'package:advanced_calculator/src/business_logic/provider/result_provider.dart';
import 'package:advanced_calculator/src/view/screen/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

//? Texts

class ProcessTextWidget extends StatelessWidget {
  final String text;
  const ProcessTextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: MyTextTheme.processStyle(context),
      textAlign: TextAlign.end,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class ResultTextWidget extends StatelessWidget {
  final String text;
  const ResultTextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 56),
      maxLines: 1,
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

  const FilledButtonTonalWidget({
    super.key,
    required this.child,
    required this.func,
    this.isBigButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FilledButton.tonal(
      onPressed: func,
      style: MyButtonTheme.filledTonalButtonTheme(size, isBigButton),
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
              func: () {
              },
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

class SciButtonsWidget extends StatelessWidget {


  const SciButtonsWidget({
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
              func: () {
                context.read<ProcessProvider>().addtoProcess("C");
                context.read<ResultProvider>().addtoProcess("C");
              },
              child: const Text(
                "C",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            FilledButtonWidget(
              func: () {
                context.read<ProcessProvider>().addtoProcess("<-");
                context.read<ResultProvider>().addtoProcess("<-");
              },
              child: const Icon(FontAwesome.left_long_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {
                context.read<ProcessProvider>().addtoProcess("\u0025");
                context.read<ResultProvider>().addtoProcess("\u0025");
              },
              child: const Icon(FontAwesome.percent_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {
                context.read<ProcessProvider>().addtoProcess("\u00F7");
                context.read<ResultProvider>().addtoProcess("\u00F7");
              },
              child: const Icon(FontAwesome.divide_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {
                context.read<ProcessProvider>().addtoProcess("\u00D7");
                context.read<ResultProvider>().addtoProcess("\u00D7");
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
                context.read<ProcessProvider>().addtoProcess("7");
                context.read<ResultProvider>().addtoProcess("7");
              },
              child: const SpecialTextWidget(text: "7"),
            ),
            TextButtonWidget(
              func: () {
                context.read<ProcessProvider>().addtoProcess("8");
                context.read<ResultProvider>().addtoProcess("8");
              },
              child: const SpecialTextWidget(text: "8"),
            ),
            TextButtonWidget(
              func: () {
                context.read<ProcessProvider>().addtoProcess("9");
                context.read<ResultProvider>().addtoProcess("9");
              },
              child: const SpecialTextWidget(text: "9"),
            ),
            FilledButtonTonalWidget(
              func: () {
                context.read<ProcessProvider>().addtoProcess("\u2212");
                context.read<ResultProvider>().addtoProcess("\u2212");
              },
              child: const Icon(FontAwesome.minus_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {
                context.read<ProcessProvider>().addtoProcess("\u002B");
                context.read<ResultProvider>().addtoProcess("\u002B");
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
                context.read<ProcessProvider>().addtoProcess("4");
                context.read<ResultProvider>().addtoProcess("4");
              },
              child: const SpecialTextWidget(text: "4"),
            ),
            TextButtonWidget(
              func: () {
                context.read<ProcessProvider>().addtoProcess("5");
                context.read<ResultProvider>().addtoProcess("5");
              },
              child: const SpecialTextWidget(text: "5"),
            ),
            TextButtonWidget(
              func: () {
                context.read<ProcessProvider>().addtoProcess("6");
                context.read<ResultProvider>().addtoProcess("6");
              },
              child: const SpecialTextWidget(text: "6"),
            ),
            FilledButtonTonalWidget(
              func: () {
                context.read<ProcessProvider>().addtoProcess("\u221A");
                context.read<ResultProvider>().addtoProcess("\u221A");
              },
              child: const Icon(
                FontAwesome.square_root_variable_solid,
                size: 16,
              ),
            ),
            FilledButtonTonalWidget(
              func: () {
                context.read<ProcessProvider>().addtoProcess("\u00B2");
                context.read<ResultProvider>().addtoProcess("q");
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
                context.read<ProcessProvider>().addtoProcess("1");
                context.read<ResultProvider>().addtoProcess("1");
              },
              child: const SpecialTextWidget(text: "1"),
            ),
            TextButtonWidget(
              func: () {
                context.read<ProcessProvider>().addtoProcess("2");
                context.read<ResultProvider>().addtoProcess("2");
              },
              child: const SpecialTextWidget(text: "2"),
            ),
            TextButtonWidget(
              func: () {
                context.read<ProcessProvider>().addtoProcess("3");
                context.read<ResultProvider>().addtoProcess("3");
              },
              child: const SpecialTextWidget(text: "3"),
            ),
            FilledButtonTonalWidget(
              func: () {
                context.read<ProcessProvider>().addtoProcess("^");
                context.read<ResultProvider>().addtoProcess("w");
              },
              child: const SpecialFilledTextWidget(text: "^"),
            ),
            FilledButtonTonalWidget(
              func: () {}, // Paranteze bakılacak
              child: const SpecialFilledTextWidget(text: "( )"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilledButtonTonalWidget(
              func: () {}, // Bakılacak
              child: const Icon(FontAwesome.plus_minus_solid, size: 16),
            ),
            TextButtonWidget(
              func: () {
                context.read<ProcessProvider>().addtoProcess("0");
                context.read<ResultProvider>().addtoProcess("0");
              },
              child: const SpecialTextWidget(text: "0"),
            ),
            TextButtonWidget(
              func: () { // ResultProvider için bakılacak. Virgül ile işlemi söyle
                context.read<ProcessProvider>().addtoProcess(",");
              },
              child: const SpecialTextWidget(text: ","),
            ),
            FilledButtonTonalWidget(
              func: () {}, // Bakılacak
              child: const SpecialFilledTextWidget(text: "Rad"),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: const Icon(FontAwesome.right_left_solid, size: 14),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilledButtonTonalWidget(
              func: () { // ResultProvider için bakılacak.
                context.read<ProcessProvider>().addtoProcess("sin(");
              },
              child: const SpecialFilledTextWidget(text: "sin"),
            ),
            FilledButtonTonalWidget(
              func: () { // ResultProvider için bakılacak.
                context.read<ProcessProvider>().addtoProcess("cos(");
              },
              child: const SpecialFilledTextWidget(text: "cos"),
            ),
            FilledButtonTonalWidget(
              func: () { // ResultProvider için bakılacak.
                context.read<ProcessProvider>().addtoProcess("tan(");
              },
              child: const SpecialFilledTextWidget(text: "tan"),
            ),
            FilledButtonTonalWidget(
              func: () {  // ResultProvider için bakılacak.
                context.read<ProcessProvider>().addtoProcess("π");
              },
              child: const SpecialFilledTextWidget(text: "π"),
            ),
            FilledButtonTonalWidget(
              func: () { // ResultProvider için bakılacak.
                context.read<ProcessProvider>().addtoProcess("e");
              },
              child: const SpecialFilledTextWidget(text: "e"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilledButtonTonalWidget(
              func: () { // ResultProvider için bakılacak.
                context.read<ProcessProvider>().addtoProcess("ln(");
              },
              child: const SpecialFilledTextWidget(text: "ln"),
            ),
            FilledButtonTonalWidget(
              func: () { // ResultProvider için bakılacak.
                context.read<ProcessProvider>().addtoProcess("log(");
              },
              child: const SpecialFilledTextWidget(text: "log"),
            ),
            FilledButtonTonalWidget( // ResultProvider için bakılacak.
              func: () {}, // Bakılacak
              child: const SpecialFilledTextWidget(text: "1/x"),
            ),
            FilledButtonTonalWidget(
              func: () {}, // Bakılacak. ResultProvider için bakılacak.
              child: const SpecialFilledTextWidget(text: "|x|"),
            ),
            FilledButtonWidget(
              func: () {
                context.read<ResultProvider>().addtoProcess("=");
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

  const SpecialFilledTextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(fontSize: 16));
  }
}

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
          ListView.builder(
            itemCount: pastProcess.length,
            itemBuilder: (context, index) {
              return PastItemWidget(
                proces: pastProcess.keys.toList()[index],
                result: pastProcess.values.toList()[index],
              );
            },
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: IconButton.filledTonal(
              icon: const Icon(FontAwesome.trash_solid, size: 16),
              onPressed: () {},
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
