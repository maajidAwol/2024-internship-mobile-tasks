import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entities/user.dart';
import '../repository/auth_repository.dart';

class Login {
  final AuthRepository authrepository;

  Login(this.authrepository);
  Future<Either<Failure,User>> execute({required String name, required String email, required String password}){
    return  authrepository.signUp(name: name,email: email,password: password);
  }
}