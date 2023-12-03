import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInTextChangeEvent>((event, emit) {
      if (!EmailValidator.validate(event.emailValue)) {
        emit(const SignInErrorState(errorMessage: 'Invalid Email'));
      } else if (event.passValue.length <= 7) {
        emit(const SignInErrorState(errorMessage: 'Invalid Password'));
      } else {
        emit(SignInValidState());
      }
    });

    on<SignInLoadingEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
