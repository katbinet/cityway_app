import 'package:city_way/core/error/Failure.dart';
import 'package:city_way/features/Auth/domain/entities/user.dart';
import 'package:city_way/features/Auth/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class SignInUseCase {
  final UserRepository userRepository;

  SignInUseCase({required this.userRepository});

  Future<Either<Failure, User>> call(User user) async{
    return await userRepository.signIn(user);
  }
}

