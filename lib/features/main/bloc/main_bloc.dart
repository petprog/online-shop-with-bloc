import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainInitialState()) {
    on<MainInitailEvent>(mainInitialEvent);
    on<MainChangePageEvent>(mainChangePageEvent);
  }

  FutureOr<void> mainInitialEvent(
      MainInitailEvent event, Emitter<MainState> emit) {
    emit(const MainInitialState());
  }

  FutureOr<void> mainChangePageEvent(
      MainChangePageEvent event, Emitter<MainState> emit) {
    emit(MainPageIndexState(event.pageIndex));
    // print(state.pageIndex);
  }
}
