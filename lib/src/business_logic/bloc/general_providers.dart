import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

final calculatorModeProvider = StateProvider((ref) => true);

final upButtonProvider = StateProvider((ref) => false);

final changeButtonProvider = StateProvider((ref) => false);

final functionProvider = StateProvider((ref) => "");

//-----------

final themeModeProvider = StateProvider((ref) => ThemeMode.system);
