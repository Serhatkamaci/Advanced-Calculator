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
    "\u2074": "4",
    "\u2075": "5",
    "\u2076": "6",
    "\u2077": "7",
    "\u2078": "8",
    "\u2079": "9",
    "ğ": "(",
    "ü": ")",
    "\u221A(": "SQRT(",
    "log(": "LOG10(",
    "ln(": "LOG(",
    "π": "Pİ",
    "w": "^",
    "q": "^(2)",
    "e": "e",
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
