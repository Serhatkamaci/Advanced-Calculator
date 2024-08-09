import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GarbageCollactor extends ChangeNotifier {
  GarbageCollactor();

  Map<String, String> garbage = {};

  Map readtoGarbage() {
    return garbage;
  }

  void addtoGarbage(String process, String result) {
    garbage[process] = result;
  }
}

final garbageCollactorProvider = ChangeNotifierProvider(
  (ref) => GarbageCollactor(),
);

