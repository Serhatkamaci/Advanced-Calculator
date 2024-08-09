import 'package:advanced_calculator/core/button_styles.dart';
import 'package:advanced_calculator/src/model/graph_drawer.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FunctionTextField extends StatelessWidget {
  const FunctionTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: const Icon(FontAwesome.circle_xmark, size: 24),
        enabledBorder: MyButtonTheme.enabledFuncBorder(context),
        focusedBorder: MyButtonTheme.focusedFuncBorder(context),
        labelText: "function",
        hintText: "e.g: x^2",
      ),
    );
  }
}

//------------------------------------------------------------------------------

class GraphWidget extends StatelessWidget {
  final String function;

  const GraphWidget({
    super.key,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
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
            dataSource: GraphDrawer.generateData(function),
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
