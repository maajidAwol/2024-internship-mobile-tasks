import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failure/failure.dart';
import 'package:e_commerce_app/features/product/domain/repositories/product_repository.dart';

class DeleteProduct {
  ProductRepository productRepository;
  String id;
  DeleteProduct(this.productRepository, this.id);

  Future<Either<Failure, void>> execute() {
    
    return productRepository.deleteProduct(id);
  }
}
