import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calculatorModeProvider = StateProvider((ref) => true);

final themeModeProvider = StateProvider((ref) => ThemeMode.system);

final upButtonProvider = StateProvider((ref) => false);

final changeButtonProvider = StateProvider((ref) => false);

final functionProvider = StateProvider((ref) => "");