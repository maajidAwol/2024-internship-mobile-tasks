import 'package:image_app/domain/entities/image_entity.dart';

import '../repository/image_repository.dart';

class GetAllImages {
  final ImageRepository imageRepository;
  GetAllImages({required this.imageRepository});

  Future<List<ImageEntity>> execute() {
    return imageRepository.getImages();
  }
  
}
