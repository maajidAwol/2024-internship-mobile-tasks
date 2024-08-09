import 'dart:convert';
import 'dart:io';

import 'package:e_commerce_app/core/constants/constants.dart';
import 'package:e_commerce_app/features/product/data/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import '../../../../core/failure/exception.dart';

abstract class ProductDataSource extends Equatable {
  Future<List<ProductModel>> getAllProduct();
  Future<ProductModel> getOneProduct(String id);
  Future<ProductModel> insertProduct(ProductModel newProduct);
  Future<ProductModel> updateProduct(ProductModel updatedProduct);
  Future<String> deleteProduct(String id);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductRemoteDataSource extends ProductDataSource {
  final http.Client client;
  ProductRemoteDataSource({required this.client});

  @override
  Future<List<ProductModel>> getAllProduct() async {
    final response = await client.get(Uri.parse(Urls.baseUrl));

    if (response.statusCode == 200) {
      return ProductModel.fromJsonList(json.decode(response.body)["data"]);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> getOneProduct(String id) async {
    final response = await client.get(Uri.parse(Urls.getProductById(id)));

    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body)["data"][0]);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> insertProduct(ProductModel newProduct) async {
    final response = await client.post(Uri.parse(Urls.baseUrl,) ,body: newProduct.toJson());

    if (response.statusCode == 201) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
  @override
  Future<ProductModel> updateProduct(ProductModel updatedProduct) async {

    final response = await client.put(Uri.parse(Urls.getProductById(updatedProduct.id)),body: updatedProduct.toJson());

      if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
    
  }
  @override
  Future<String> deleteProduct(String id) async {
   final response = await client.delete(Uri.parse(Urls.getProductById(id)));

  if (response.statusCode == 200) {
      return "deleted";
    } else {
      throw ServerException();
    }

  }
}
