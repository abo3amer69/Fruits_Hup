import 'package:dartz/dartz.dart';
import 'package:fruits_hup/core/errors/failure.dart';
import 'package:fruits_hup/features/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> creatUserWithEmailAndPassword(
      String email, String password, String name);

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password);

  Future<Either<Failure, UserEntity>> siginWithGoogle();

  Future<Either<Failure, UserEntity>> siginWithFacebook();

  Future addUserData({required UserEntity user});
  Future<UserEntity> getUserData({required String uid});
}
