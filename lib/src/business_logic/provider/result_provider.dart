import 'package:advanced_calculator/src/business_logic/provider/garbage_collactor_provider.dart';
import 'package:advanced_calculator/src/business_logic/provider/process_provider.dart';
import 'package:advanced_calculator/src/model/unique_converter.dart';
import 'package:advanced_calculator/src/view/widget/calculator_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

List<String> copyPastUniqueConverterList = [];

class Result extends ChangeNotifier {
  GarbageCollactor garbageProvider;
  Process processProvider;
  // ignore: prefer_typing_uninitialized_variables
  var upButtonProvider;

  Result(this.garbageProvider, this.processProvider, this.upButtonProvider);

  String senttoUniqueConverter = "";
  String showtoScreenResultValue = "0";
  List<String> pastUniqueConverterList = [];

  String readtoProcessResult() {
    return showtoScreenResultValue;
  }

  void addtoProcess(String process) {
    if (process == "wğ") {
      if (pastUniqueConverterList.last == "ü") {
        pastUniqueConverterList.removeLast();
        int index = senttoUniqueConverter.lastIndexOf("ü");
        senttoUniqueConverter = senttoUniqueConverter.substring(0, index);
      } else {
        pastUniqueConverterList.add(process);
        senttoUniqueConverter += process;
      }
    } else if (process == "ü" && pastUniqueConverterList.last == "wğ") {
      pastUniqueConverterList.removeLast();
      int index = senttoUniqueConverter.lastIndexOf("wğ");
      senttoUniqueConverter = senttoUniqueConverter.substring(0, index);
    } else if (process == "<-") {
      if (pastUniqueConverterList.last == "wğ") {
        upButtonProvider.state = false;
      } else if (pastUniqueConverterList.last == "ü") {
        upButtonProvider.state = true;
      }
      if (pastUniqueConverterList.isNotEmpty) {
        String lastElement = pastUniqueConverterList.last;
        int index = senttoUniqueConverter.lastIndexOf(lastElement);
        if (index != 0) {
          senttoUniqueConverter = senttoUniqueConverter.substring(0, index);
        } else {
          senttoUniqueConverter = "";
        }
        pastUniqueConverterList.removeLast();
      } else {
        senttoUniqueConverter = "";
      }
    } else if (process == "=") {
      resultProcess();
      garbageProvider.addtoGarbage(
        processProvider.procesString,
        showtoScreenResultValue,
      );
      copyPastUniqueConverterList = showtoScreenResultValue.split('');
      pastUniqueConverterList = showtoScreenResultValue.split('');
      processProvider.procesString = showtoScreenResultValue;
      processProvider.pastProcessList = showtoScreenResultValue.split('');
      senttoUniqueConverter = showtoScreenResultValue;
    } else if (process == "C") {
      upButtonProvider.state = false;
      senttoUniqueConverter = "";
      showtoScreenResultValue = "0";
      pastUniqueConverterList = [];
    } else {
      pastUniqueConverterList.add(process);
      senttoUniqueConverter += process;
    }
    copyPastUniqueConverterList = pastUniqueConverterList;
    notifyListeners();
  }

  void resultProcess() {
    showtoScreenResultValue = UniqueConverter.resultString(
        UniqueConverter.convertString(senttoUniqueConverter));
  }
}

final resulProvider = ChangeNotifierProvider(
  (ref) => Result(
    ref.read(garbageCollactorProvider),
    ref.read(processProvider),
    ref.read(upButtonProvider.notifier),
  ),
);
