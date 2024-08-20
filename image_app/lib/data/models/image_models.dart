import 'package:equatable/equatable.dart';
import 'package:image_app/domain/entities/image_entity.dart';

class ImageModel extends Equatable {
  String imageUrl;
  String title;
  ImageModel({required this.imageUrl, required this.title});
  @override
  List<Object?> get props => [imageUrl, title];

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      ImageModel(imageUrl: json["url"], title: json["title"]);

  ImageEntity toEntity() => ImageEntity(imageUrl: imageUrl, title: title);
}
