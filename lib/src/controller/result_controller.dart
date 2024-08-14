import 'package:advanced_calculator/src/controller/garbage_controller.dart';
import 'package:advanced_calculator/src/controller/general_variable.dart';
import 'package:advanced_calculator/src/controller/process_controller.dart';
import 'package:advanced_calculator/src/model/unique_converter.dart';
import 'package:get/get.dart';

List<String> copyPastUniqueConverterList = [];

class ResultController extends GetxController {
  var garbageController = Get.find<GarbageController>();
  var processController = Get.find<ProcessController>();

  String senttoUniqueConverter = "";
  var showtoScreenResultValue = "0".obs;
  List<String> pastUniqueConverterList = [];

  void addtoProcess(String process) {
    if (process == "()") {
      if (pastUniqueConverterList.isEmpty ||
          (int.tryParse(pastUniqueConverterList.last) == null &&
              pastUniqueConverterList.last != ")")) {
        pastUniqueConverterList.add("(");
        senttoUniqueConverter += "(";
      } else if (parenthesesCount != 0 && pastUniqueConverterList.last != "(") {
        pastUniqueConverterList.add(")");
        senttoUniqueConverter += ")";
      }
    } else if (process == "ö" && senttoUniqueConverter.isNotEmpty) {
      senttoUniqueConverter = "-$senttoUniqueConverter";
    } else if (process == "wğ") {
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
        upButtonVariable.value = false;
      } else if (pastUniqueConverterList.last == "ü") {
        upButtonVariable.value = true;
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
      isNumeric(showtoScreenResultValue.value)
          ? null
          : showtoScreenResultValue.value = "0";
      garbageController.addtoGarbage(
        processController.procesString.value,
        showtoScreenResultValue.value,
      );

      if (int.tryParse(showtoScreenResultValue.value) != null &&
          showtoScreenResultValue != "0") {
        copyPastUniqueConverterList = showtoScreenResultValue.split('');
        pastUniqueConverterList = showtoScreenResultValue.split('');
        processController.procesString.value = showtoScreenResultValue.value;
        processController.pastProcessList = showtoScreenResultValue.split('');
        senttoUniqueConverter = showtoScreenResultValue.value;
      } else {
        copyPastUniqueConverterList = [];
        pastUniqueConverterList = [];
        processController.procesString.value = "";
        processController.pastProcessList = [];
        senttoUniqueConverter = "";
      }
    } else if (process == "1/x" && senttoUniqueConverter.isNotEmpty) {
      copyPastUniqueConverterList.insertAll(0, ["1", "/", "("]);
      copyPastUniqueConverterList.add(")");
      pastUniqueConverterList.insertAll(0, ["1", "/", "("]);
      pastUniqueConverterList.add(")");
      senttoUniqueConverter = "1/($senttoUniqueConverter)";
    } else if (process == "C") {
      upButtonVariable.value = false;
      senttoUniqueConverter = "";
      showtoScreenResultValue.value = "0";
      pastUniqueConverterList = [];
    } else if (process != "ö") {
      pastUniqueConverterList.add(process);
      senttoUniqueConverter += process;
    }
    copyPastUniqueConverterList = pastUniqueConverterList;
  }

  void resultProcess() {
    showtoScreenResultValue.value = UniqueConverter.resultString(
        UniqueConverter.convertString(senttoUniqueConverter));
  }

  bool isNumeric(String s) => double.tryParse(s) != null;
}
