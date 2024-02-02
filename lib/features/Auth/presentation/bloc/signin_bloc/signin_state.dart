part of 'signin_bloc.dart';

sealed class SigninState extends Equatable {
  const SigninState();
  
  @override
  List<Object> get props => [];
}

final class SigninInitial extends SigninState {}


class LoadingState extends SigninState{}

class SuccessState extends SigninState{
  final String message;

  const  SuccessState({required this.message});

  @override
  List<Object> get props => [message];
}

class ErrorState extends SigninState{
  final String message;

  const ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}