import 'package:e_commerce_app/core/network/network_info.dart';
import 'package:e_commerce_app/features/auth/data/data_sources/remote_data_sources.dart';
import 'package:e_commerce_app/features/auth/data/repository/repository_implimentation.dart';
import 'package:e_commerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:e_commerce_app/features/auth/domain/usecase/login.dart';
import 'package:e_commerce_app/features/auth/domain/usecase/signup.dart';
import 'package:e_commerce_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:e_commerce_app/features/product/data/data_sources/product_remote_data_source.dart';
import 'package:e_commerce_app/features/product/data/repositories/product_repository_implimentation.dart';
import 'package:e_commerce_app/features/product/domain/repositories/product_repository.dart';
import 'package:e_commerce_app/features/product/domain/usecase/delete_product_usecase.dart';
import 'package:e_commerce_app/features/product/domain/usecase/get_all_product_usecase.dart';
import 'package:e_commerce_app/features/product/domain/usecase/get_one_product_usecase..dart';
import 'package:e_commerce_app/features/product/domain/usecase/insert_product_usecase.dart';
import 'package:e_commerce_app/features/product/domain/usecase/update_product_usecase.dart';
import 'package:e_commerce_app/features/product/presentation/bloc/home/home_bloc.dart';
import 'package:e_commerce_app/features/product/presentation/bloc/insert_product/insert_product_bloc.dart';
import 'package:e_commerce_app/features/product/presentation/bloc/update/update_product_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'features/auth/data/data_sources/local_data_sources.dart';
import 'features/product/data/data_sources/product_local_data_source.dart';
import 'features/product/presentation/bloc/search/search_product_bloc.dart';

GetIt getIt = GetIt.instance;

Future<void> setup() async {
  // var sharedPreferance = await SharedPreferences.getInstance();
  var httpClient = http.Client();
  var sharedPreferences = await SharedPreferences.getInstance();
  var networkInfo = InternetConnectionChecker();
  // var internetStatus = InternetStatus.connected;
  getIt.registerFactory<NetworkInfo>(
      () => NetworkInfoImplimentation(internetStatus: networkInfo));
  getIt.registerSingleton<ProductRemoteDataSource>(
      ProductRemoteDataSource(client: httpClient));
  getIt.registerSingleton<ProductLocalDatasource>(
      ProductLocalDataSourceImpl(sharedPreferences: sharedPreferences));
      
  getIt.registerSingleton<ProductRepository>(
    ProductRepositoryImplimentation(productRemoteDataSource: getIt(), networkInfo: getIt(), productLocalDataSource: getIt()),
  );
  getIt.registerSingleton<GetAllProductUsecase>(GetAllProductUsecase(getIt()));
  getIt.registerSingleton<InsertProduct>(InsertProduct(getIt()));
  getIt.registerSingleton<UpdateProduct>(UpdateProduct(getIt()));
  getIt.registerSingleton<DeleteProduct>(DeleteProduct(getIt()));

  getIt.registerSingleton<HomeBloc>(HomeBloc(getAllProductUsecase: getIt()));
  getIt.registerSingleton<InsertProductBloc>(
      InsertProductBloc(insertProductUsecase: getIt()));
  getIt.registerSingleton<SearchBloc>(SearchBloc());
  getIt.registerSingleton<UpdateProductBloc>(UpdateProductBloc(
    updateProduct: getIt(),
    deleteProduct: getIt(),
  ));
//auth
  getIt.registerSingleton<AuthRemoteDataSources>(
      AuthRemoteDataSources(client: httpClient));
  getIt.registerSingleton<AuthLocalDataSource>(
      AuthLocalDataSource(sharedPreferences: sharedPreferences));
  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImplimentation(
        authLocalDataSource: getIt(), authRemoteDataSources: getIt(),networkInfo: getIt()),
  );

  getIt.registerSingleton<Login>(Login(getIt()));
  getIt.registerSingleton<SignUp>(SignUp(getIt()));
  getIt.registerSingleton<AuthBloc>(AuthBloc(login: getIt(), signUp: getIt()));
}
