part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInTextChangeEvent extends SignInEvent {
  final String emailValue;
  final String passValue;

  const SignInTextChangeEvent({
    required this.emailValue,
    required this.passValue,
  });
}

class SignInSubmitEvent extends SignInEvent {
  final String email;
  final String pass;

  const SignInSubmitEvent({
    required this.email,
    required this.pass,
  });
}

class SignInLoadingEvent extends SignInEvent {}
