part of 'product_bloc.dart';

abstract class ProductEvent {}

class ProductChangePageEvent extends ProductEvent {
  final int pageIndex;
  ProductChangePageEvent({required this.pageIndex});
}

class ProductAddShoeSizes extends ProductEvent {
  final List<dynamic> shoeSizes;
  ProductAddShoeSizes(this.shoeSizes);
}

class ProductCheckShoeSizes extends ProductEvent {
  final int index;
  ProductCheckShoeSizes(this.index);
}

class ProductUnCheckAllShoeSizes extends ProductEvent {}

class ProductAddSizes extends ProductEvent {
  final List<dynamic> sizes;
  ProductAddSizes(this.sizes);
}
