part of 'cart_bloc.dart';

abstract class CartEvent {}

class CartGetCartEvent extends CartEvent {}

class CartRemoveItemEvent extends CartEvent {
  final String id;
  CartRemoveItemEvent(this.id);
}

class CartAddNewCartEvent extends CartEvent {
  final Map<String, dynamic> newCart;
  CartAddNewCartEvent(this.newCart);
}

class CartIncrementItemQtyEvent extends CartEvent {
  final String id;
  CartIncrementItemQtyEvent(this.id);
}

class CartDecrementItemQtyEvent extends CartEvent {
  final String id;
  CartDecrementItemQtyEvent(this.id);
}
