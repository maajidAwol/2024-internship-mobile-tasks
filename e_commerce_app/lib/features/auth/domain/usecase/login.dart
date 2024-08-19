import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entities/user.dart';
import '../repository/auth_repository.dart';

class SignUp {
  final AuthRepository authrepository;

  SignUp(this.authrepository);
  Future<Either<Failure,String>> execute(String email,String password){
    return  authrepository.logIn(email: email,password: password);
  }
}