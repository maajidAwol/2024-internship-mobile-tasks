import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:image_app/data/data_sources/remote_data_source.dart';
import 'package:image_app/domain/repository/image_repository.dart';
import 'package:image_app/domain/usecases/get_image_usecase.dart';
import 'package:image_app/presentation/bloc/home/home_bloc.dart';

import 'data/repository/repository_implimentation.dart';
import 'domain/usecases/get_searched_usecase.dart';

GetIt getIt = GetIt.instance;

Future<void> setup() async{
  var client = http.Client();
  getIt.registerSingleton<RemoteDataSource>(RemoteDataSource(client: client));
  getIt.registerSingleton<ImageRepository>(ImageRepositoryImplimentation(remoteDataSource: getIt()));
  getIt.registerSingleton<GetAllImages>(GetAllImages(imageRepository: getIt()));
  getIt.registerSingleton<GetSearchedImages>(GetSearchedImages(imageRepository: getIt()));
  getIt.registerSingleton<HomeBloc>(HomeBloc(getAllImages: getIt(), getSearch: getIt()));
  
  
}
