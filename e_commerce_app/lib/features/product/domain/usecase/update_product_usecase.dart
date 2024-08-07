import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failure/failure.dart';
import 'package:e_commerce_app/features/product/domain/enteties/product.dart';
import 'package:e_commerce_app/features/product/domain/repositories/product_repository.dart';

class UpdateProduct {
  String id;
  ProductEntity updatedProduct;
  ProductRepository productRepository;
  UpdateProduct(this.productRepository,this.updatedProduct, this.id);

  Future<Either<Failure, void>> execute() {
    return productRepository.updateProduct(id, updatedProduct);
  }
}
