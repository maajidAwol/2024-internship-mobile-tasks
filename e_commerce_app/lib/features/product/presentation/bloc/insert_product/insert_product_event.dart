part of 'insert_product_bloc.dart';

class ProductInsertedEvent {}

class ProductInserted extends ProductInsertedEvent {
  ProductEntity product;
  ProductInserted({required this.product});
}