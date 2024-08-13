import 'package:flutter_bloc/flutter_bloc.dart';

class GarbageCollactorCubit extends Cubit<Map<String, String>>{
  GarbageCollactorCubit():super({});

  void addtoGarbage(String process, String result) {
    state[process]=result;
    emit(state);
  }
}