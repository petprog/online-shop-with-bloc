import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/sneakers_model.dart';
import '../../../services/helper.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitialState()) {
    on<HomeGetProductsEvent>(getProductsEvent);
  }

  FutureOr<void> getProductsEvent(
      HomeGetProductsEvent event, Emitter<HomeState> emit) async {
    final menSneakersList = await Helper().getSneakersByType('men');
    final womenSneakersList = await Helper().getSneakersByType('women');
    final kidsSneakersList = await Helper().getSneakersByType('kids');
    emit(
        HomeSuccessState(menSneakersList, womenSneakersList, kidsSneakersList));
  }
}
