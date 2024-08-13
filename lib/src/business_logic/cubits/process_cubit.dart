import 'package:advanced_calculator/src/business_logic/cubits/result_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

int parenthesesCount = 0;

class ProcessCubit extends Cubit<String>{
  
  ProcessCubit():super("");
  List<String> pastProcessList = [];

  void addtoProcess(String process){
    
    if (process == "<-" &&
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
    }else if (process == "()") {
      if (pastProcessList.isEmpty ||
          (int.tryParse(pastProcessList.last) == null &&
              pastProcessList.last != ")")) {
        pastProcessList.add("(");
        emit(state+"(");
        parenthesesCount++;
      } else if (parenthesesCount != 0 && pastProcessList.last != "(") {
        pastProcessList.add(")");
        emit(state+")");
        parenthesesCount--;
      }
    } else if (process == "1/x" && state.isNotEmpty) {
      emit("1\u00F7($state)");
      pastProcessList.insertAll(0, ["1", "/", "("]);
      pastProcessList.add(")");
    } else if (process == "C") {
      emit("");
      pastProcessList = [];
      parenthesesCount = 0;
    } else if (process != "<-") {
      pastProcessList.add(process);
      emit(state+process);
    }
  }
}