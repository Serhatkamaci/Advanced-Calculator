import 'package:advanced_calculator/src/business_logic/provider/result_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

int parenthesesCount = 0;

class Process extends ChangeNotifier {
  String procesString = "";
  List<String> pastProcessList = [];

  String readtoProcess() {
    return procesString;
  }

  void addtoProcess(String process) {

    if (process == "<-" &&
        !(copyPastUniqueConverterList.last == "wğ" ||
            copyPastUniqueConverterList.last == "ü")) {
      if (pastProcessList.isNotEmpty) {
        String lastElement = pastProcessList.last;
        pastProcessList.removeLast();
        int index = procesString.lastIndexOf(lastElement);
        procesString = procesString.substring(0, index);
        parenthesesCount+=1;
      } else {
        procesString = "";
      }
    } else if (process == "()") {
      if (pastProcessList.isEmpty ||
          (int.tryParse(pastProcessList.last) == null &&
              pastProcessList.last != ")")) {
        pastProcessList.add("(");
        procesString += "(";
        parenthesesCount++;
      } else if (parenthesesCount != 0 && pastProcessList.last != "(") {
        pastProcessList.add(")");
        procesString += ")";
        parenthesesCount--;
      }
    } else if (process == "1/x" && procesString.isNotEmpty) {
      procesString = "1\u00F7($procesString)";
      pastProcessList.insertAll(0, ["1", "/", "("]);
      pastProcessList.add(")");
    } else if (process == "C") {
      procesString = "";
      pastProcessList = [];
      parenthesesCount=0;
    } else if (process != "<-") {
      pastProcessList.add(process);
      procesString += process;
    }
    notifyListeners();
  }
}

final processProvider = ChangeNotifierProvider((ref) => Process());
