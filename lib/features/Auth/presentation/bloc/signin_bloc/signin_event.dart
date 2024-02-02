part of 'signin_bloc.dart';

sealed class SigninEvent extends Equatable {
  const SigninEvent();

  @override
  List<Object> get props => [];
}

class SignInEvent extends SigninEvent{
  final User user;

  const SignInEvent({required this.user});

  @override
  List<Object> get props => [user];
}