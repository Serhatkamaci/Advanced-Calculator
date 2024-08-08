import 'package:eval_ex/expression.dart';

class UniqueConverter {
  static Map<String, String> unicodeMaps = {
    "\u002B": "+",
    "\u2212": "-",
    "\u00F7": "/",
    "\u00D7": "*",
    "\u0025": "%",
    "\u2070": "0",
    "\u00B9": "1",
    "\u00B2": "2",
    "\u00B3": "3",
    "\u02074": "4",
    "\u02075": "5",
    "\u02076": "6",
    "\u02077": "7",
    "\u02078": "8",
    "\u02079": "9",
    "ğ": "(",
    "ü": ")",
    "\u221A": "SQRT",
    "log(": "LOG10",
    "ln(": "LOG",
    "π": "PI",
    "w": "^",
    "q": "^(2)",
  };

  static String convertString(String process) {
    for (var entry in unicodeMaps.entries) {
      process = process.replaceAll(entry.key, entry.value);
    }

    return process;
  }

  static String resultString(String convertedProcess) {
    Expression exp = Expression(convertedProcess);
    return exp.eval().toString();
  }
}
