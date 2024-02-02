import 'package:bloc/bloc.dart';
import 'package:city_way/core/error/Failure.dart';
import 'package:city_way/core/string/failure.dart';
import 'package:city_way/core/string/messages.dart';
import 'package:city_way/features/Auth/domain/entities/user.dart';
import 'package:city_way/features/Auth/domain/usecases/signup_usecase.dart';
import 'package:equatable/equatable.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignUpUseCase signUpUseCase;
  SignupBloc({required this.signUpUseCase}) : super(SignupInitial()) {
    on<SignupEvent>((event, emit) async{
      if(event is SignUpEvent){
        emit(LoadingState());
        final user = await signUpUseCase(event.user);
        user.fold(
                (failure){
                  emit(ErrorState(message: mapFailureToMessageInfo(failure)));
                },
                (user) {
                  emit(const SuccessState(message: SIGN_IN_SUCCESS_MESSAGE));
                },
        );
  }});
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
