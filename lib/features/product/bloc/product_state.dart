part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  final List<dynamic> shoeSizes;
  final List<dynamic> sizes;
  final int activePage;

  const ProductState(this.shoeSizes, this.sizes, this.activePage);
}

class ProductInitialState extends ProductState {
  ProductInitialState() : super([], [], 0);

  @override
  List<Object?> get props => [shoeSizes, sizes, activePage];
}

class ProductSuccess extends ProductState {
  const ProductSuccess(
    List<dynamic> shoeSizes,
    List<dynamic> sizes,
    int activePage,
  ) : super(shoeSizes, sizes, activePage);

  @override
  List<Object?> get props => [shoeSizes, sizes, activePage];
}
