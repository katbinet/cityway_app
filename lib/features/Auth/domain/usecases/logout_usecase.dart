import 'package:city_way/features/Auth/domain/repositories/user_repository.dart';

class LogOutUseCase {
  final UserRepository userRepository;

  LogOutUseCase({required this.userRepository});

  /*Future<Either<Failure, Unit>> call() async{
    return await userRepository.logout();
  }*/
}