import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> logIn(
      {required String email, required String password});

  Future<Either<Failure, User>> signUp(
      {required String name,required String email, required String password});

  Future<Either<Failure, Void>> signOut();
}