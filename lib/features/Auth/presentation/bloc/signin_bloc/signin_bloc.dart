import 'package:bloc/bloc.dart';
import 'package:city_way/core/error/Failure.dart';
import 'package:city_way/core/string/messages.dart';
import 'package:city_way/features/Auth/domain/entities/user.dart';
import 'package:city_way/features/Auth/domain/usecases/signin_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/string/failure.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final SignInUseCase signInUseCase;
  SigninBloc({required this.signInUseCase}) : super(SigninInitial()) {
    on<SigninEvent>((event, emit) async {
      if (event is SignInEvent) {
        //emit(LoadingState());
        final user = await signInUseCase(event.user);
        user.fold(
          (failure) {
            emit(ErrorState(message: mapFailureToMessageInfo(failure)));
          },
          (_) {
            emit(const SuccessState(message: SIGN_IN_SUCCESS_MESSAGE));
          },
        );
      }
    });
  }

  String mapFailureToMessageInfo(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case OfflineFailure:
        return offlineFailureMessage;
      
      /*case WeakPasswordFailure:
        return weakPasswordFailureMessage;
      case ExistsAccountFailure:
        return accountExistsFailureMessage;
      */
      default:
        return "An Unexpected Wrong, Please try again later!.";
    }
  }
}
