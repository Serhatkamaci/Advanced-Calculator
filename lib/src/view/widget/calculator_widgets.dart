import 'package:advanced_calculator/core/button_styles.dart';
import 'package:advanced_calculator/core/text_styles.dart';
import 'package:advanced_calculator/src/view/screen/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

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
              func: () {},
              child: const Text(
                "C",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            FilledButtonWidget(
              func: () {},
              child: const Icon(FontAwesome.left_long_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: const Icon(FontAwesome.percent_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: const Icon(FontAwesome.divide_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: const Icon(FontAwesome.xmark_solid, size: 16),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButtonWidget(
              func: () {},
              child: const SpecialTextWidget(text: "7"),
            ),
            TextButtonWidget(
              func: () {},
              child: const SpecialTextWidget(text: "8"),
            ),
            TextButtonWidget(
              func: () {},
              child: const SpecialTextWidget(text: "9"),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: const Icon(FontAwesome.minus_solid, size: 16),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: const Icon(FontAwesome.plus_solid, size: 16),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButtonWidget(
              func: () {},
              child: const SpecialTextWidget(text: "4"),
            ),
            TextButtonWidget(
              func: () {},
              child: const SpecialTextWidget(text: "5"),
            ),
            TextButtonWidget(
              func: () {},
              child: const SpecialTextWidget(text: "6"),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: const Icon(
                FontAwesome.square_root_variable_solid,
                size: 16,
              ),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: const SpecialFilledTextWidget(text: "x\u00B2"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButtonWidget(
              func: () {},
              child: const SpecialTextWidget(text: "1"),
            ),
            TextButtonWidget(
              func: () {},
              child: const SpecialTextWidget(text: "2"),
            ),
            TextButtonWidget(
              func: () {},
              child: const SpecialTextWidget(text: "3"),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: const SpecialFilledTextWidget(text: "^"),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: const SpecialFilledTextWidget(text: "( )"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilledButtonTonalWidget(
              func: () {},
              child: const Icon(FontAwesome.plus_minus_solid, size: 16),
            ),
            TextButtonWidget(
              func: () {},
              child: const SpecialTextWidget(text: "0"),
            ),
            TextButtonWidget(
              func: () {},
              child: const SpecialTextWidget(text: ","),
            ),
            FilledButtonTonalWidget(
              func: () {},
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
              func: () {},
              child: const SpecialFilledTextWidget(text: "sin"),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: const SpecialFilledTextWidget(text: "cos"),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: const SpecialFilledTextWidget(text: "tan"),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: const SpecialFilledTextWidget(text: "π"),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: const SpecialFilledTextWidget(text: "e"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilledButtonTonalWidget(
              func: () {},
              child: const SpecialFilledTextWidget(text: "ln"),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: const SpecialFilledTextWidget(text: "log"),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: const SpecialFilledTextWidget(text: "1/x"),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: const SpecialFilledTextWidget(text: "|x|"),
            ),
            FilledButtonWidget(
              func: () {},
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
