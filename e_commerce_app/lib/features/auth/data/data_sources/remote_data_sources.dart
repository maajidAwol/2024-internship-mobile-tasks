import 'dart:convert';

import 'package:e_commerce_app/core/constants/constants.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class AuthRemoteDataSources {
  final http.Client client;
  AuthRemoteDataSources({required this.client});

  Future<String> logIn(String email, String password) async {
    final response = await client.post(
      Uri.parse(Urls.loginUrl),
      body: {
        'email': email,
        'password': password,
      },
    );

    String token = json.decode(response.body)['data']['access_token'];
    if (response.statusCode == 201) {
      print(token);
      return token;
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<UserModel> signUp(String name, String email, String password) async {
    final response = await client.post(
      Uri.parse(Urls.signUpUrl),
      body: {
        'name': name,
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 201) {
      print(response.body);
      return UserModel.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to register');
    }
  }
}
