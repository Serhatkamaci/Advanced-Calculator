import 'package:eval_ex/expression.dart';

class TrigonometricErrors extends FormatException {
  
  String errorMessage="";
  TrigonometricErrors({this.errorMessage="Invalid value"});

  @override
  String toString() {
    return "Invalid value";
  }
}


class UndefinedErrors extends ExpressionException {
  
  String errorMessage="";

  UndefinedErrors({this.errorMessage="Undefined value"}):super(errorMessage);

  @override
  String toString() {
    return "Undefined value";
  }
}