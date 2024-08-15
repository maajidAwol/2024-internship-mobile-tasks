
import 'package:e_commerce_app/core/network/network_info.dart';
import 'package:e_commerce_app/features/product/data/data_sources/product_remote_data_source.dart';
import 'package:e_commerce_app/features/product/data/repositories/product_repository_implimentation.dart';
import 'package:e_commerce_app/features/product/domain/repositories/product_repository.dart';
import 'package:e_commerce_app/features/product/domain/usecase/get_all_product_usecase.dart';
import 'package:e_commerce_app/features/product/domain/usecase/get_one_product_usecase..dart';
import 'package:e_commerce_app/features/product/domain/usecase/insert_product_usecase.dart';
import 'package:e_commerce_app/features/product/presentation/bloc/home/home_bloc.dart';
import 'package:e_commerce_app/features/product/presentation/bloc/insert_product/insert_product_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

GetIt getIt = GetIt.instance;

Future<void> setup() async {
  // var sharedPreferance = await SharedPreferences.getInstance();
  var httpClient = http.Client();

  // var internetStatus = InternetStatus.connected;
  // getIt.registerFactory<NetworkInfoImplimentation>(
  //     () => NetworkInfoImplimentation(internetStatus: internetStatus));
  getIt.registerSingleton<ProductRemoteDataSource>(
      ProductRemoteDataSource(client: httpClient));
  getIt.registerSingleton<ProductRepository>(
    ProductRepositoryImplimentation(productRemoteDataSource: getIt()),
  );
  getIt.registerSingleton<GetAllProductUsecase>(GetAllProductUsecase(getIt()));
  getIt.registerSingleton<InsertProduct>(InsertProduct(getIt()));

  getIt.registerSingleton<HomeBloc>(
      HomeBloc(getAllProductUsecase: getIt()));
  getIt.registerSingleton<InsertProductBloc>(
      InsertProductBloc(insertProductUsecase: getIt()));

}
