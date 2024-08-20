import 'dart:convert';

import '../../domain/entities/image_entity.dart';
import 'package:http/http.dart' as http;

import '../models/image_models.dart';

class RemoteDataSource {
  final http.Client client;
  RemoteDataSource({required this.client});

  Future<List<ImageModel>> getImages({String term = "nature"}) async {
    print(term);
    String url =
        'https://real-time-image-search.p.rapidapi.com/search?query=${term}&limit=10&size=any&color=any&type=any&time=any&usage_rights=any&file_type=any&aspect_ratio=any&safe_search=off&region=us';
    final result = await client.get(Uri.parse(url), headers: {
      "x-rapidapi-host": "real-time-image-search.p.rapidapi.com",
      "x-rapidapi-key": "729c2a12d6mshe0e7274c186125dp12f0c6jsn8cfa728d6a12"
    });
    if (result.statusCode == 200) {
      
      final resultList = json.decode(result.body)["data"];

      List<ImageModel> images =
          (resultList as List).map((img) => ImageModel.fromJson(img)).toList();
 
      return images;
    } else {
      return [];
    }
  }
}


