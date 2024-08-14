import 'package:get/get.dart';

class GarbageController extends GetxController {
  var garbage = <String, String>{}.obs;

  void addtoGarbage(String process, String result) {
    garbage[process] = result;
  }
}