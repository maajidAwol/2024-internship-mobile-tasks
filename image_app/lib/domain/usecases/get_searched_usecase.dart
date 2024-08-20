import 'package:image_app/domain/entities/image_entity.dart';

import '../repository/image_repository.dart';

class GetSearchedImages {
  final ImageRepository imageRepository;
  GetSearchedImages({required this.imageRepository});

  Future<List<ImageEntity>> execute(String term) {
    return imageRepository.getSearched(
    term);
  }
  
}
