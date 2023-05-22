part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  final List<Map<String, dynamic>> cart;
  const CartState(this.cart);
}

class CartInitialState extends CartState {
  CartInitialState() : super([]);

  @override
  List<Object?> get props => [];
}

class CartSuccessState extends CartState {
  const CartSuccessState(List<Map<String, dynamic>> cart) : super(cart);

  @override
  List<Object?> get props => [cart];
}
