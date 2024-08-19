import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failure/failure.dart';
import 'package:e_commerce_app/features/auth/data/data_sources/local_data_sources.dart';
import 'package:e_commerce_app/features/auth/data/data_sources/remote_data_sources.dart';
import 'package:e_commerce_app/features/auth/domain/entities/user.dart';
import 'package:e_commerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:e_commerce_app/features/product/data/data_sources/product_remote_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImplimentation extends AuthRepository {
  AuthRemoteDataSources authRemoteDataSources;
  AuthLocalDataSource authLocalDataSource;
  AuthRepositoryImplimentation(
      {required this.authRemoteDataSources, required this.authLocalDataSource});
  @override
  Future<Either<Failure, String>> logIn(
      {required String email, required String password}) async {
    try {
      final result = await authRemoteDataSources.logIn(email, password);
      authLocalDataSource.cacheToken(result);

      return Right(result);
    } catch (e) {
      print(e);
      return left(Failure("failed to login"));
    }
  }

  @override
  Future<Either<Failure, Void>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> signUp(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final result = await authRemoteDataSources.signUp(name, email, password);
      return Right(result.toUser());
    } catch (e) {
      print(e);
      return left(Failure("failed to login"));
    }
  }
}
