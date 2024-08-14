import 'package:advanced_calculator/src/business_logic/bloc/garbage_bloc.dart';
import 'package:advanced_calculator/src/business_logic/bloc/process_bloc.dart';
import 'package:advanced_calculator/src/model/unique_converter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

List<String> copyPastUniqueConverterList = [];
bool isEqual = false;

sealed class ResultEvent {
  const ResultEvent();
}

final class AddtoProcessInResult extends ResultEvent {
  final String process;

  const AddtoProcessInResult({required this.process});
}

//! showtoScreenResultValue
class ResultBloc extends Bloc<ResultEvent, String> {
  ResultBloc(
      {required this.garbageBloc,
      required this.processBloc,
      required this.upButtonVariable})
      : super("0") {
    on<AddtoProcessInResult>(addtoProcess);
  }

  final GarbageBloc garbageBloc;
  final ProcessBloc processBloc;
  final ValueNotifier<bool> upButtonVariable;
  String senttoUniqueConverter = "";
  List<String> pastUniqueConverterList = [];

  void addtoProcess(AddtoProcessInResult event, Emitter<String> emit) {
    if (isEqual) {
      state != "0"
          ? processBloc.add(EqualProcess(result: state))
          : processBloc.add(const EqualProcess(result: ""));

      isEqual = !isEqual;
    }
    if (event.process == "()") {
      if (pastUniqueConverterList.isEmpty ||
          (int.tryParse(pastUniqueConverterList.last) == null &&
              pastUniqueConverterList.last != ")")) {
        pastUniqueConverterList.add("(");
        senttoUniqueConverter += "(";
      } else if (parenthesesCount != 0 && pastUniqueConverterList.last != "(") {
        pastUniqueConverterList.add(")");
        senttoUniqueConverter += ")";
      }
    } else if (event.process == "ö" && senttoUniqueConverter.isNotEmpty) {
      senttoUniqueConverter = "-$senttoUniqueConverter";
    } else if (event.process == "wğ") {
      if (pastUniqueConverterList.last == "ü") {
        pastUniqueConverterList.removeLast();
        int index = senttoUniqueConverter.lastIndexOf("ü");
        senttoUniqueConverter = senttoUniqueConverter.substring(0, index);
      } else {
        pastUniqueConverterList.add(event.process);
        senttoUniqueConverter += event.process;
      }
    } else if (event.process == "ü" && pastUniqueConverterList.last == "wğ") {
      pastUniqueConverterList.removeLast();
      int index = senttoUniqueConverter.lastIndexOf("wğ");
      senttoUniqueConverter = senttoUniqueConverter.substring(0, index);
    } else if (event.process == "<-") {
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
    } else if (event.process == "=") {
      resultProcess(emit);
      isNumeric(state) ? null : emit("0");
      garbageBloc.add(
        AddtoGarbage(
          process: processBloc.state,
          result: state,
        ),
      );
      if (double.tryParse(state) != null && state != "0") {
        copyPastUniqueConverterList = state.split('');
        pastUniqueConverterList = state.split('');
        processBloc.pastProcessList = state.split('');
        senttoUniqueConverter = state;
      } else {
        copyPastUniqueConverterList = [];
        pastUniqueConverterList = [];
        processBloc.pastProcessList = [];
        senttoUniqueConverter = "";
      }
      isEqual = !isEqual;
    } else if (event.process == "1/x" && senttoUniqueConverter.isNotEmpty) {
      copyPastUniqueConverterList.insertAll(0, ["1", "/", "("]);
      copyPastUniqueConverterList.add(")");
      pastUniqueConverterList.insertAll(0, ["1", "/", "("]);
      pastUniqueConverterList.add(")");
      senttoUniqueConverter = "1/($senttoUniqueConverter)";
    } else if (event.process == "C") {
      upButtonVariable.value = false;
      senttoUniqueConverter = "";
      emit("0");
      pastUniqueConverterList = [];
    } else if (event.process != "ö") {
      pastUniqueConverterList.add(event.process);
      senttoUniqueConverter += event.process;
    }
    copyPastUniqueConverterList = pastUniqueConverterList;
  }

  void resultProcess(Emitter<String> emit) {
    emit(
      UniqueConverter.resultString(
          UniqueConverter.convertString(senttoUniqueConverter)),
    );
  }

  bool isNumeric(String s) => double.tryParse(s) != null;
}
