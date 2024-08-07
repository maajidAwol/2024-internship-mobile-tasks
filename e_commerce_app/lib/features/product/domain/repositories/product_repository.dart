import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failure/failure.dart';
import 'package:e_commerce_app/features/product/domain/enteties/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getAllProduct();
  Future<Either<Failure, ProductEntity>> getOneProduct(String id);
  Future<Either<Failure,void>> insertProduct(ProductEntity newProduct);
  Future<Either<Failure,void>> deleteProduct(String id);
  Future<Either<Failure,void>> updateProduct(String id, ProductEntity updatedProduct);
}
