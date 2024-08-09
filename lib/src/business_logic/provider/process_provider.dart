import 'package:advanced_calculator/src/business_logic/provider/result_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

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
      } else {
        procesString = "";
      }
    } else if (process == "C") {
      procesString = "";
      pastProcessList = [];
    } else if (process != "<-") {
      pastProcessList.add(process);
      procesString += process;
    }
    notifyListeners();
  }
}

final processProvider = ChangeNotifierProvider((ref) => Process());
