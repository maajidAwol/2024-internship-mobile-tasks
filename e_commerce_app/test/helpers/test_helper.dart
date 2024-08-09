import 'package:e_commerce_app/features/product/domain/repositories/product_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dummy/dummy.dart';
// import '';

@GenerateMocks(
  [
  ProductRepository],

  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)]
)

void main(){

}