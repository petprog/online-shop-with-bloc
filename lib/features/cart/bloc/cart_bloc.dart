import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final _cartBox = Hive.box('cart_box');

  CartBloc() : super(CartInitialState()) {
    on<CartAddNewCartEvent>(addNewCartEvent);
    on<CartGetCartEvent>(getCartEvent);
    on<CartRemoveItemEvent>(removeItemEvent);
    on<CartIncrementItemQtyEvent>(incrementItemQtyEvent);
    on<CartDecrementItemQtyEvent>(decrementItemQtyEvent);
  }

  FutureOr<void> addNewCartEvent(
      CartAddNewCartEvent event, Emitter<CartState> emit) async {
    for (var item in state.cart) {
      if (item['id'] == event.newCart['id']) {
        _cartBox.delete(item['key']);
      }
    }
    await _cartBox.add(event.newCart);
    add(CartGetCartEvent());
  }

  FutureOr<void> getCartEvent(CartGetCartEvent event, Emitter<CartState> emit) {
    final cartData = _cartBox.keys.map((key) {
      final item = _cartBox.get(key);
      return {
        "key": key,
        "id": item['id'],
        "category": item['category'],
        "name": item['name'],
        "imageUrl": item['imageUrl'],
        "price": item['price'],
        "qty": item['qty'],
        "sizes": item['sizes']
      };
    }).toList();

    final cartReversed = cartData.reversed.toList();
    emit(CartSuccessState(cartReversed));
  }

  FutureOr<void> removeItemEvent(
      CartRemoveItemEvent event, Emitter<CartState> emit) {
    for (var item in state.cart) {
      if (item['id'] == event.id) {
        _cartBox.delete(item['key']);
      }
    }
    add(CartGetCartEvent());
  }

  FutureOr<void> incrementItemQtyEvent(
      CartIncrementItemQtyEvent event, Emitter<CartState> emit) {
    for (var item in state.cart) {
      if (item['id'] == event.id) {
        item['qty'] = (item['qty'] ?? 0) + 1;
        _cartBox.put(item['key'], item);
      }
    }
    add(CartGetCartEvent());
  }

  FutureOr<void> decrementItemQtyEvent(
      CartDecrementItemQtyEvent event, Emitter<CartState> emit) {
    for (var item in state.cart) {
      if (item['id'] == event.id && item['qty'] >= 1) {
        item['qty'] = (item['qty'] ?? 1) - 1;
        _cartBox.put(item['key'], item);
      }
    }
    add(CartGetCartEvent());
  }
}
