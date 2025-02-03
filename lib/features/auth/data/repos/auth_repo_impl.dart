import 'package:dartz/dartz.dart';
import 'package:fruits_hup/core/errors/failure.dart';
import 'package:fruits_hup/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hup/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failure, UserEntity>> creatUserWithEmailAndPassword(
      String email, String password) {
    // TODO: implement creatUserWithEmailAndPassword
    throw UnimplementedError();
  }
}
