import 'package:image_app/domain/entities/image_entity.dart';

import '../../domain/repository/image_repository.dart';
import '../data_sources/remote_data_source.dart';
import 'package:http/http.dart' as http;
class ImageRepositoryImplimentation extends ImageRepository {
  final RemoteDataSource remoteDataSource;

  ImageRepositoryImplimentation({required this.remoteDataSource});
  @override
  Future<List<ImageEntity>> getImages() async {
    try {
      final result =  await remoteDataSource.getImages();
      List<ImageEntity> images = result.map((img) => img.toEntity()).toList();
      print(images);
      return images;
    } catch (e) {
      print(e);
      throw e;
    }
    // TODO: implement getImages
    throw UnimplementedError();
  }

  @override
  Future<List<ImageEntity>> getSearched(String term) async {
    try {
      final result =  await remoteDataSource.getImages(term: term);
      List<ImageEntity> images = result.map((img) => img.toEntity()).toList();
      print(images);
      return images;
    } catch (e) {
      print(e);
      throw e;
    }
    // TODO: implement getImages
    throw UnimplementedError();
  }
  }


