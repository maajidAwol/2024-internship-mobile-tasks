part of 'insert_product_bloc.dart';

abstract class InsertProductState {}
class InsertProductInitial  extends InsertProductState{
  InsertProductInitial();
}

class InsertedProductLoading extends InsertProductState {
  InsertedProductLoading();
  
}

class InsertedProductFail extends InsertProductState {
  InsertedProductFail();
}

class InsertedProductSuccess extends InsertProductState {
  ProductEntity insertededProduct;
  InsertedProductSuccess({required this.insertededProduct});
}
