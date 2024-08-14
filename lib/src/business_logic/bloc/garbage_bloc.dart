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

final class ClearGarbage extends GarbageEvent {
  const ClearGarbage();
}

class GarbageBloc extends Bloc<GarbageEvent, Map<String, String>> {
  GarbageBloc() : super({}) {
    on<AddtoGarbage>(addtoGarbage);
    on<ClearGarbage>(clearGarbage);
  }

  void clearGarbage(ClearGarbage event, Emitter<Map<String, String>> emit) {
    emit({});
  }

  void addtoGarbage(AddtoGarbage event, Emitter<Map<String, String>> emit) {
    var newState = state;
    newState[event.process] = event.result;
    emit(newState);
  }
}
