import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failure/failure.dart';
import 'package:e_commerce_app/features/product/domain/enteties/product.dart';
import 'package:e_commerce_app/features/product/domain/repositories/product_repository.dart';

class InsertProduct {
  ProductRepository productRepository;
  ProductEntity newProduct;

  InsertProduct(this.productRepository, this.newProduct);

  Future<Either<Failure, void>> execute() {
    return productRepository.insertProduct(newProduct);
  }
}
