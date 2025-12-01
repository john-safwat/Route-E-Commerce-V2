import 'dart:async';

import 'package:bloc/bloc.dart';

abstract class BaseCubit<T, A, NE> extends Cubit<T> {
  BaseCubit(super.initialState);

  Future<void> doAction(A action);

  final StreamController<NE> _navigationStream = StreamController.broadcast();

  Stream<NE> get navigation => _navigationStream.stream;

  void emitNavigation(NE navigationEvent) {
    _navigationStream.add(navigationEvent);
  }

  @override
  Future<void> close() {
    _navigationStream.close();
    return super.close();
  }
}
