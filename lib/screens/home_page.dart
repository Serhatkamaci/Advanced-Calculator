import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            "assets/images/calculator2.png",
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FilledButton(
              style: FilledButton.styleFrom(
                fixedSize: Size(size.width / 4, size.width / 9),
              ),
              onPressed: () {},
              child: const Text(
                "Calculator",
              ),
            ),
            TextButton(
              style: FilledButton.styleFrom(
                fixedSize: Size(size.width / 4, size.width / 9),
              ),
              onPressed: () {
                Navigator.popAndPushNamed(context, "/graph");
              },
              child: const Text("Graph"),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.dark_mode_outlined),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 12),
                width: size.width,
                child: Text(
                  "100+204+105+30+195",
                  style: TextStyle(
                    fontSize: 32,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              SizedBox(
                width: size.width,
                child: const Text(
                  "634",
                  style: TextStyle(
                    fontSize: 52,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Bootstrap.clock,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Divider(
                  thickness: 2.0,
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
              ),

              const BasicButtons(),
              // SizedBox(
              //   height: size.height / 2,
              //   child: const SciButtons(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class BasicButtons extends StatelessWidget {
  const BasicButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FilledButtonWidget(
              func: () {},
              child: const Text(
                "C",
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
            FilledButtonWidget(
              func: () {},
              child: Image.asset(
                "assets/images/arrow-big-left-dash.png",
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: Image.asset(
                "assets/images/percent.png",
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: Image.asset(
                "assets/images/divide.png",
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButtonWidget(func: () {}, child: const Text("7")),
            TextButtonWidget(func: () {}, child: const Text("8")),
            TextButtonWidget(func: () {}, child: const Text("9")),
            FilledButtonTonalWidget(
              func: () {},
              child: Image.asset(
                "assets/images/x.png",
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButtonWidget(func: () {}, child: const Text("4")),
            TextButtonWidget(func: () {}, child: const Text("5")),
            TextButtonWidget(func: () {}, child: const Text("6")),
            FilledButtonTonalWidget(
              func: () {},
              child: Image.asset(
                "assets/images/minus.png",
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButtonWidget(func: () {}, child: const Text("1")),
            TextButtonWidget(func: () {}, child: const Text("2")),
            TextButtonWidget(func: () {}, child: const Text("3")),
            FilledButtonTonalWidget(
              func: () {},
              child: Image.asset(
                "assets/images/plus.png",
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButtonWidget(
              func: () {},
              child: Image.asset(
                "assets/images/diff.png",
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            TextButtonWidget(func: () {}, child: const Text("0")),
            TextButtonWidget(func: () {}, child: const Text(",")),
            FilledButtonWidget(
              func: () {},
              child: Image.asset(
                "assets/images/equal.png",
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SciButtons extends StatelessWidget {
  const SciButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FilledButtonWidget(
              func: () {},
              child: const Text(
                "C",
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
            FilledButtonWidget(
              func: () {},
              child: Image.asset(
                "assets/images/arrow-big-left-dash.png",
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: Image.asset(
                "assets/images/percent.png",
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: Image.asset(
                "assets/images/divide.png",
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: Image.asset(
                "assets/images/x.png",
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButtonWidget(func: () {}, child: const Text("7")),
            TextButtonWidget(func: () {}, child: const Text("8")),
            TextButtonWidget(func: () {}, child: const Text("9")),
            FilledButtonTonalWidget(
              func: () {},
              child: Image.asset(
                "assets/images/minus.png",
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: Image.asset(
                "assets/images/plus.png",
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButtonWidget(func: () {}, child: const Text("4")),
            TextButtonWidget(func: () {}, child: const Text("5")),
            TextButtonWidget(func: () {}, child: const Text("6")),
            FilledButtonTonalWidget(
              func: () {},
              child: Image.asset(
                "assets/images/square.png",
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: Image.asset(
                "assets/images/Frame 3.png",
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButtonWidget(func: () {}, child: const Text("1")),
            TextButtonWidget(func: () {}, child: const Text("2")),
            TextButtonWidget(func: () {}, child: const Text("3")),
            FilledButtonTonalWidget(
              func: () {},
              child: Image.asset(
                "assets/images/Frame 4.png",
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: Image.asset(
                "assets/images/Frame 5.png",
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FilledButtonTonalWidget(
              func: () {},
              child: Image.asset(
                "assets/images/diff.png",
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            TextButtonWidget(func: () {}, child: const Text("0")),
            TextButtonWidget(func: () {}, child: const Text(",")),
            FilledButtonTonalWidget(
              func: () {},
              child: const Text("Rad"),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: Image.asset(
                "assets/images/reverse.png",
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FilledButtonTonalWidget(
              func: () {},
              child: const Text("sin"),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: const Text("cos"),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: const Text("tan"),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: const Text("π"),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: const Text("e"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FilledButtonTonalWidget(
              func: () {},
              child: const Text("ln"),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: const Text("log"),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: const Text("1/x"),
            ),
            FilledButtonTonalWidget(
              func: () {},
              child: const Text("|x|"),
            ),
            FilledButtonWidget(
              func: () {},
              child: Image.asset(
                "assets/images/equal.png",
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

//-------------------------------------------------

class FilledButtonWidget extends StatelessWidget {
  final void Function() func;
  final Widget child;

  const FilledButtonWidget({
    super.key,
    required this.child,
    required this.func,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FilledButton(
      onPressed: func,
      style: FilledButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        //fixedSize: Size(size.width / 6, size.width / 6),
      ),
      child: child,
    );
  }
}

class FilledButtonTonalWidget extends StatelessWidget {
  final void Function() func;
  final Widget child;

  const FilledButtonTonalWidget({
    super.key,
    required this.child,
    required this.func,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FilledButton.tonal(
      onPressed: func,
      style: FilledButton.styleFrom(
          //fixedSize: Size(size.width / 6, size.width / 6),
          ),
      child: child,
    );
  }
}

class TextButtonWidget extends StatelessWidget {
  final void Function() func;
  final Widget child;

  const TextButtonWidget({
    super.key,
    required this.func,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 28),
        //fixedSize: Size(size.width / 6, size.width / 6),
      ),
      onPressed: func,
      child: child,
    );
  }
}
