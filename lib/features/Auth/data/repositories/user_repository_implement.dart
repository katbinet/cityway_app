import 'package:city_way/core/error/Failure.dart';
import 'package:city_way/core/error/exception.dart';
import 'package:city_way/features/Auth/data/datasource/local_data_source.dart';
import 'package:city_way/features/Auth/data/datasource/remote_data_source.dart';
import 'package:city_way/features/Auth/domain/entities/user.dart';
import 'package:city_way/features/Auth/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImp implements UserRepository {
  //final NetworkInfo networkInfo;
  //final FirebaseAuth _firebaseAuth;

  //UserRepositoryImp({FirebaseAuth? firebaseAuth, required Object remoteDataSource, required Object localDataSource})
    //  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  UserRepositoryImp({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, User>> signIn(User user) async {
    try {} on ServerException {
      return Left(ServerFailure());
    }
    return Left(OfflineFailure());
  }

  @override
  Future<Either<Failure, User>> signUp(User user) async {
    try {} on ServerException {
      return Left(ServerFailure());
    }
    return Left(OfflineFailure());
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      //await _firebaseAuth.signOut();
    } on ServerException {
      return Left(ServerFailure());
    }
    throw UnimplementedError();
  }
}