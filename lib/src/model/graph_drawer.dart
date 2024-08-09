import 'package:eval_ex/expression.dart';

class GraphDrawer {
  static List<ChartData> generateData(String function) {
    List<ChartData> data = [];
    for (double x = -10; x < 10; x += 0.1) {
      String y =
          _evaluateFunction(function, double.parse(x.toStringAsFixed(2)));
      y == "NaN" ? null : data.add(ChartData(x, num.parse(y)));
    }
    return data;
  }

  static String _evaluateFunction(String function, double x) {
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