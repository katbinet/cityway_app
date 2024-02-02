part of 'signup_bloc.dart';

sealed class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignUpEvent extends SignupEvent{
  final User user;

  const SignUpEvent({required this.user});

  @override
  List<Object> get props => [user];
}
