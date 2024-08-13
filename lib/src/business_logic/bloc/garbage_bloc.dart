import 'package:flutter_bloc/flutter_bloc.dart';

sealed class GarbageEvent {
  const GarbageEvent();
}

final class AddtoGarbage extends GarbageEvent {
  final String process;
  final String result;

  const AddtoGarbage({
    required this.process,
    required this.result,
  });
}

class GarbageBloc extends Bloc<GarbageEvent, Map<String, String>> {
  GarbageBloc() : super({}) {
    on<AddtoGarbage>(addtoGarbage);
  }

  void addtoGarbage(AddtoGarbage event, Emitter<Map<String, String>> emit) {
    var newState = state;
    newState[event.process] = event.result;
    emit(newState);
  }
}
