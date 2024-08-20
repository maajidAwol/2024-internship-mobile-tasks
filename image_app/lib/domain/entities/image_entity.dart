import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  String imageUrl;
  String title;
  ImageEntity({required this.imageUrl, required this.title});
  @override
  List<Object?> get props => [imageUrl, title];
}
