import '../entities/image_entity.dart';

abstract class ImageRepository {
  Future<List<ImageEntity>> getImages();
  Future<List<ImageEntity>> getSearched(String term);
}
