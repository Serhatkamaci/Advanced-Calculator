import 'package:advanced_calculator/src/business_logic/bloc/result_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

int parenthesesCount = 0;

sealed class ProcessEvent {
  const ProcessEvent();
}

final class AddtoProcess extends ProcessEvent {
  final String process;

  const AddtoProcess({required this.process});
}

final class EqualProcess extends ProcessEvent {
  final String result;

  const EqualProcess({required this.result});
}

//! processString
class ProcessBloc extends Bloc<ProcessEvent, String> {
  ProcessBloc() : super("") {
    on<AddtoProcess>(addtoProcess);
    on<EqualProcess>(equalProcess);
  }

  List<String> pastProcessList = [];

  void equalProcess(EqualProcess event, Emitter<String> emit) {
    emit(event.result);
  }

  void addtoProcess(AddtoProcess event, Emitter<String> emit) {
    if (event.process == "<-" &&
        !(copyPastUniqueConverterList.last == "wğ" ||
            copyPastUniqueConverterList.last == "ü")) {
      if (pastProcessList.isNotEmpty) {
        String lastElement = pastProcessList.last;
        pastProcessList.removeLast();
        int index = state.lastIndexOf(lastElement);
        emit(state.substring(0, index));
      } else {
        emit("");
      }
      if (copyPastUniqueConverterList.last == "(") {
        parenthesesCount -= 1;
      } else if (copyPastUniqueConverterList.last == ")") {
        parenthesesCount += 1;
      }
    } else if (event.process == "()") {
      if (pastProcessList.isEmpty ||
          (int.tryParse(pastProcessList.last) == null &&
              pastProcessList.last != ")")) {
        pastProcessList.add("(");
        emit("$state(");
        parenthesesCount++;
      } else if (parenthesesCount != 0 && pastProcessList.last != "(") {
        pastProcessList.add(")");
        emit("$state)");
        parenthesesCount--;
      }
    } else if (event.process == "1/x" && state.isNotEmpty) {
      emit("1\u00F7($state)");
      pastProcessList.insertAll(0, ["1", "/", "("]);
      pastProcessList.add(")");
    } else if (event.process == "C") {
      emit("");
      pastProcessList = [];
      parenthesesCount = 0;
    } else if (event.process != "<-") {
      pastProcessList.add(event.process);
      emit(state + event.process);
    }
  }
}
