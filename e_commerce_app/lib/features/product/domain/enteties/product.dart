import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  String name;
  String description;
  String imageUrl;
  double price;
  String id;
  ProductEntity(
      {required this.description,
      required this.id,
      required this.imageUrl,
      required this.name,
      required this.price});
  @override
  // TODO: implement props
  List<Object?> get props => [
    name,id,description,imageUrl,price,
  ];
}
