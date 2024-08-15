import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failure/failure.dart';
import 'package:e_commerce_app/features/product/domain/enteties/product.dart';
import 'package:e_commerce_app/features/product/domain/repositories/product_repository.dart';

class InsertProduct {
  ProductRepository productRepository;
  

  InsertProduct(this.productRepository);

  Future<Either<Failure, void>> execute(ProductEntity newProduct) {
    return productRepository.insertProduct(newProduct);
  }
}
