import 'package:city_way/core/error/Failure.dart';
import 'package:city_way/core/error/exception.dart';
import 'package:city_way/features/Auth/domain/entities/user.dart' as CityUser;
import 'package:city_way/features/Auth/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepositoryImp implements UserRepository {
  //final NetworkInfo networkInfo;
  final FirebaseAuth _firebaseAuth;

  UserRepositoryImp({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  //final RemoteDataSource remoteDataSource;
  //final LocalDataSource localDataSource;

  //UserRepositoryImp({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, CityUser.User>> signIn(CityUser.User user) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
    } on ServerException {
      return Left(ServerFailure());
    }
    return Left(OfflineFailure());
  }

  @override
  Future<Either<Failure, CityUser.User>> signUp(CityUser.User user) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
    } on ServerException {
      return Left(ServerFailure());
    }
    return Left(OfflineFailure());
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await _firebaseAuth.signOut();
    } on ServerException {
      return Left(ServerFailure());
    }
    throw UnimplementedError();
  }
}
