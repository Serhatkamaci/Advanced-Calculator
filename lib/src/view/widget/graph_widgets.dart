import 'package:advanced_calculator/core/button_styles.dart';
import 'package:eval_ex/expression.dart';
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

class GraphPage2 extends StatefulWidget {
  final String function;

  const GraphPage2({super.key, required this.function});

  @override
  // ignore: library_private_types_in_public_api
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
              dataSource: _generateData(widget.function),
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              color: Theme.of(context).colorScheme.primary,
              width: 4,
            ),
          ],
        ),
      ),
    );
  }

  List<ChartData> _generateData(String function) {
    List<ChartData> data = [];
    for (double x = -10; x < 10; x += 0.1) {
      String y =
          _evaluateFunction(function, double.parse(x.toStringAsFixed(2)));
      y == "NaN" ? null : data.add(ChartData(x, num.parse(y)));
    }
    return data;
  }

  String _evaluateFunction(String function, double x) {
    String sonuc = "";
    Expression exp = Expression(function);
    exp.setStringVariable("x", x.toString());
    print(x);
    try {
      sonuc = exp.eval().toString();
    } catch (e) {
      return "NaN";
    }

    return sonuc;
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final num x;
  final num y;
}
