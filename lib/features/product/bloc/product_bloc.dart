import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitialState()) {
    on<ProductAddShoeSizes>(addShoesSizes);
    on<ProductAddSizes>(addSizes);
    on<ProductChangePageEvent>(changeActivePage);
    on<ProductCheckShoeSizes>(checkShoeSize);
    on<ProductUnCheckAllShoeSizes>(uncheckAllShoeSize);
  }

  FutureOr<void> addShoesSizes(
      ProductAddShoeSizes event, Emitter<ProductState> emit) {
    emit(ProductSuccess(event.shoeSizes, state.sizes, state.activePage));
    // print("addShoesSizes ${state.shoeSizes}");
  }

  FutureOr<void> addSizes(ProductAddSizes event, Emitter<ProductState> emit) {
    emit(ProductSuccess(state.shoeSizes, event.sizes, state.activePage));
    // print("addSizes ${state.sizes}");
  }

  FutureOr<void> changeActivePage(
      ProductChangePageEvent event, Emitter<ProductState> emit) {
    emit(ProductSuccess(state.shoeSizes, state.sizes, event.pageIndex));
  }

  FutureOr<void> checkShoeSize(
      ProductCheckShoeSizes event, Emitter<ProductState> emit) {
    for (int i = 0; i < state.shoeSizes.length; i++) {
      if (i == event.index) {
        state.shoeSizes[event.index]['isSelected'] =
            !state.shoeSizes[event.index]['isSelected'];
      }
    }
    emit(ProductSuccess(state.shoeSizes, state.sizes, state.activePage));
    // print("checkShoeSize ${state.shoeSizes}");
  }

  FutureOr<void> uncheckAllShoeSize(
      ProductUnCheckAllShoeSizes event, Emitter<ProductState> emit) {
    for (var element in state.shoeSizes) {
      element['isSelected'] = false;
    }
    emit(ProductSuccess(state.shoeSizes, state.sizes, state.activePage));
  }
}
