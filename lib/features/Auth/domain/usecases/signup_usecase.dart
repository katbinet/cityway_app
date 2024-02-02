import 'package:city_way/core/error/Failure.dart';
import 'package:city_way/features/Auth/domain/entities/user.dart';
import 'package:city_way/features/Auth/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';


class SignUpUseCase{
  final UserRepository userRepository;

  SignUpUseCase({required this.userRepository});

  Future<Either<Failure, User>> call(User user) async{
    return await userRepository.signUp(user);
  }
}