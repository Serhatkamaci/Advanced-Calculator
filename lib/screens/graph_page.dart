import 'package:flutter/material.dart';

class GraphPage extends StatelessWidget {
  const GraphPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              style: FilledButton.styleFrom(
                fixedSize: Size(size.width / 4, size.width / 9),
              ),
              onPressed: () {
                Navigator.popAndPushNamed(context, "/");
              },
              child: const Text(
                "Calculator",
              ),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                fixedSize: Size(size.width / 4, size.width / 9),
              ),
              onPressed: () {},
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
            child: TextFormField(
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.cancel_outlined,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                ),
                labelText: "function",
                hintText: "e.g: x^2",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
