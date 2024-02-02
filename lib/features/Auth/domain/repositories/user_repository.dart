import 'package:city_way/core/error/Failure.dart';
import 'package:city_way/features/Auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository{
  Future<Either<Failure,User>> signUp(User user);
  Future<Either<Failure,User>> signIn(User user);
  Future<Either<Failure,Unit>> logout();
}