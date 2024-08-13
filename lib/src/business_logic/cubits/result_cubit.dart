import 'package:advanced_calculator/src/business_logic/cubits/process_cubit.dart';
import 'package:advanced_calculator/src/model/unique_converter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<String> copyPastUniqueConverterList = [];

class ResultCubit extends Cubit<String>{
  
  // Garbage ve upButton yazılacak. 

  final processCubit;
  final upButtonCubit;
  final garbageCollactorCubit;

  ResultCubit({this.processCubit, this.upButtonCubit, this.garbageCollactorCubit}):super("0");

  String senttoUniqueConverter = "";
  List<String> pastUniqueConverterList = [];

  void addtoProcess(String process){
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
        upButtonCubit.value = false;
      } else if (pastUniqueConverterList.last == "ü") {
        upButtonCubit.value = true;
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
      isNumeric(state) ? null :emit("0");
      garbageCollactorCubit.addtoGarbage(
        processCubit.state,
        state,
      );

      if (int.tryParse(state) != null &&
          state != "0") {
        copyPastUniqueConverterList = state.split('');
        pastUniqueConverterList = state.split('');
        processCubit.emit(state);
        processCubit.pastProcessList = state.split('');
        senttoUniqueConverter = state;
      } else {
        copyPastUniqueConverterList = <String>[];
        pastUniqueConverterList = <String>[];
        processCubit.emit("");;
        processCubit.pastProcessList = <String>[];
        senttoUniqueConverter = "";
      }
    } else if (process == "1/x" && senttoUniqueConverter.isNotEmpty) {
      copyPastUniqueConverterList.insertAll(0, ["1", "/", "("]);
      copyPastUniqueConverterList.add(")");
      pastUniqueConverterList.insertAll(0, ["1", "/", "("]);
      pastUniqueConverterList.add(")");
      senttoUniqueConverter = "1/($senttoUniqueConverter)";
    } else if (process == "C") {
      upButtonCubit.value = false;
      senttoUniqueConverter = "";
      emit("0");
      pastUniqueConverterList = [];
    } else if (process != "ö") {
      pastUniqueConverterList.add(process);
      senttoUniqueConverter += process;
    }
    copyPastUniqueConverterList = pastUniqueConverterList;
  }

  void resultProcess() {
    
    emit(UniqueConverter.resultString(
        UniqueConverter.convertString(senttoUniqueConverter)));
  }

  bool isNumeric(String s) => double.tryParse(s) != null; 
}
