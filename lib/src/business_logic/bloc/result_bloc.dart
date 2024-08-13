import 'package:advanced_calculator/src/business_logic/bloc/garbage_bloc.dart';
import 'package:advanced_calculator/src/business_logic/bloc/general_providers.dart';
import 'package:advanced_calculator/src/business_logic/bloc/process_bloc.dart';
import 'package:advanced_calculator/src/model/unique_converter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<String> copyPastUniqueConverterList = [];

sealed class ResultEvent {
  const ResultEvent();
}

final class AddtoProcess extends ResultEvent {
  final String process;

  const AddtoProcess({required this.process});
}

//! showtoScreenResultValue
class ResultBloc extends Bloc<ResultEvent, String> {
  ResultBloc({
    required this.garbageBloc,
    required this.processBloc,
  }) : super("") {
    on<AddtoProcess>(addtoProcess);
  }

  final GarbageBloc garbageBloc;
  final ProcessBloc processBloc;
  String senttoUniqueConverter = "";
  List<String> pastUniqueConverterList = [];

  void addtoProcess(AddtoProcess event, Emitter<String> emit) {
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
        processBloc.add(EqualProcess(result: state));
        processBloc.pastProcessList = state.split('');
        senttoUniqueConverter = state;
      } else {
        copyPastUniqueConverterList = [];
        pastUniqueConverterList = [];
        processBloc.add(EqualProcess(result: state));
        processBloc.pastProcessList = [];
        senttoUniqueConverter = "";
      }
    } else if (event.process == "1/x" && senttoUniqueConverter.isNotEmpty) {
      copyPastUniqueConverterList.insertAll(0, ["1", "/", "("]);
      copyPastUniqueConverterList.add(")");
      pastUniqueConverterList.insertAll(0, ["1", "/", "("]);
      pastUniqueConverterList.add(")");
      senttoUniqueConverter = "1/($senttoUniqueConverter)";
    } else if (event.process == "C") {
      upButtonProvider.state = false;
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
