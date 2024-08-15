import 'dart:async';

import 'package:e_commerce_app/features/product/domain/enteties/product.dart';
import 'package:e_commerce_app/features/product/domain/usecase/insert_product_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'insert_product_event.dart';
part 'insert_product_state.dart';

class InsertProductBloc extends Bloc<ProductInsertedEvent, InsertProductState> {
  InsertProduct insertProductUsecase;
  InsertProductBloc({required this.insertProductUsecase})
      : super(InsertProductInitial()) {
    on<ProductInserted>(_onInserted);
  }

  FutureOr<void> _onInserted(
      ProductInserted event, Emitter<InsertProductState> emit) async {
    final result = await insertProductUsecase.execute(event.product);
    print('event');
    print(event.product);
    emit(InsertedProductLoading());
  }
}
