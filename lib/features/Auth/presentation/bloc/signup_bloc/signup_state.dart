part of 'signup_bloc.dart';

sealed class SignupState extends Equatable {
  const SignupState();
  
  @override
  List<Object> get props => [];
}

final class SignupInitial extends SignupState {}

class LoadingState extends SignupState{}


class SuccessState extends SignupState{
  final String message;

  const  SuccessState({required this.message});

  @override
  List<Object> get props => [message];
}

class ErrorState extends SignupState{
  final String message;

  const ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}