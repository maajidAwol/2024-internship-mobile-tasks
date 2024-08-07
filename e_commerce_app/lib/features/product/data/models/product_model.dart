import 'package:e_commerce_app/features/product/domain/enteties/product.dart';

class ProductModel extends ProductEntity {
  ProductModel(
      {required String description,
      required String id,
      required String imageUrl,
      required String name,
      required double price})
      : super(
            description: description,
            name: name,
            id: id,
            imageUrl: imageUrl,
            price: price);
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        description: json["description"] ?? '',
        id: json["id"] ?? '',
        imageUrl: json["imageUrl"] ?? '',
        name: json["name"] ?? '',
        price: (json["price"] as num?)?.toDouble() ?? 0.0,
      );

  static List<ProductModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ProductModel.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "price": price,
        "imageUrl": imageUrl,
        "id":id
      };

}
