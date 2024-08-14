import 'package:advanced_calculator/src/controller/result_controller.dart';
import 'package:get/get.dart';

int parenthesesCount = 0;

class ProcessController extends GetxController {
  var procesString = "".obs;
  List<String> pastProcessList = [];

  void addtoProcess(String process) {
    if (process == "<-" &&
        !(copyPastUniqueConverterList.last == "wğ" ||
            copyPastUniqueConverterList.last == "ü")) {
      if (pastProcessList.isNotEmpty) {
        String lastElement = pastProcessList.last;
        pastProcessList.removeLast();
        int index = procesString.value.lastIndexOf(lastElement);
        procesString.value = procesString.value.substring(0, index);
      } else {
        procesString.value = "";
      }
      if (copyPastUniqueConverterList.last == "(") {
        parenthesesCount -= 1;
      } else if (copyPastUniqueConverterList.last == ")") {
        parenthesesCount += 1;
      }
    } else if (process == "()") {
      if (pastProcessList.isEmpty ||
          (int.tryParse(pastProcessList.last) == null &&
              pastProcessList.last != ")")) {
        pastProcessList.add("(");
        procesString.value += "(";
        parenthesesCount++;
      } else if (parenthesesCount != 0 && pastProcessList.last != "(") {
        pastProcessList.add(")");
        procesString.value += ")";
        parenthesesCount--;
      }
    } else if (process == "1/x" && procesString.isNotEmpty) {
      procesString.value = "1\u00F7($procesString)";
      pastProcessList.insertAll(0, ["1", "/", "("]);
      pastProcessList.add(")");
    } else if (process == "C") {
      procesString.value = "";
      pastProcessList = [];
      parenthesesCount = 0;
    } else if (process != "<-") {
      pastProcessList.add(process);
      procesString.value += process;
    }
  }
}
