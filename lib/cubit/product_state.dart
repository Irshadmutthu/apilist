part of 'product_cubit.dart';

class ProductState {
  Future<List<Productmodel>>? futureproducts;

  ProductState({this.futureproducts});
}

class ProductInitial extends ProductState {
  ProductInitial() : super(futureproducts: Future.value([]));
}
