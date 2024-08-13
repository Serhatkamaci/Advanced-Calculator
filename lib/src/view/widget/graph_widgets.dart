import 'package:advanced_calculator/core/button_styles.dart';
import 'package:advanced_calculator/src/business_logic/provider/general_providers.dart';
import 'package:advanced_calculator/src/model/graph_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:url_launcher/url_launcher.dart';


class FunctionTextField extends ConsumerWidget {
  const FunctionTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      onChanged: (value) {
        ref.read(functionProvider.notifier).state = value;
      },
      decoration: InputDecoration(
        filled: true,
        suffixIcon: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return const InfoDiaogWidget();
              },
            );
          },
          icon: const Icon(FontAwesome.circle_info_solid),
        ),
        enabledBorder: MyButtonTheme.enabledFuncBorder(context),
        focusedBorder: MyButtonTheme.focusedFuncBorder(context),
        labelText: "function",
        hintText: "e.g: x^2",
      ),
    );
  }
}

class InfoDiaogWidget extends StatelessWidget {
  const InfoDiaogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Graph Information"),
      content: const Text(
          "To learn the function writing format, visit the following website."),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        FilledButton(
          onPressed: () async {
            await launchUrl(Uri.parse("https://pub.dev/packages/eval_ex"));
          },
          child: const Text("Go to website"),
        ),
      ],
    );
  }
}

//------------------------------------------------------------------------------

class GraphWidget extends ConsumerWidget {
  const GraphWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        zoomPanBehavior: ZoomPanBehavior(
          maximumZoomLevel: 0.5,
          enablePanning: true,
          enablePinching: true,
          enableSelectionZooming: true,
        ),
        primaryXAxis: const NumericAxis(
          minimum: -10,
          maximum: 10,
          interval: 2,
          crossesAt: 0,
          minorTicksPerInterval: 4,
        ),
        primaryYAxis: const NumericAxis(
          minimum: -10,
          maximum: 10,
          interval: 2,
          crossesAt: 0,
          minorTicksPerInterval: 4,
        ),
        series: <LineSeries>[
          LineSeries<ChartData, num>(
            dataSource: GraphDrawer.generateData(ref.watch(functionProvider)),
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            color: Theme.of(context).colorScheme.primary,
            width: 4,
          ),
        ],
      ),
    );
  }
}
