import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toeicsoeasy/features/auth/domain/usecases/signup_usecase.dart';
import 'package:toeicsoeasy/features/auth/presentation/bloc/auth_event.dart';
import 'package:toeicsoeasy/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  //Khai báo Usecase
  final SignupUseCase signupUseCase;

  AuthBloc(this.signupUseCase) : super(SignUpInitial()){
    on<CreateAnAccountSubmitted>((event, emit) {
      // emit(AccountStateUsernameSet(event.username));
    });

     on<ChooseAPasswordSubmitted>((event, emit) {
      final currentState = state;
      // if (currentState is AccountStateUsernameSet) {
      //   emit(AccountStateCompleted(currentState.username, event.password));
      // }
    });
  }
}
