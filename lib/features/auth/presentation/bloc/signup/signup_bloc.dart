import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toeicsoeasy/features/auth/domain/usecases/signup_usecase.dart';
import 'package:toeicsoeasy/features/auth/presentation/bloc/signup/signup_event.dart';
import 'package:toeicsoeasy/features/auth/presentation/bloc/signup/signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  //Khai báo Usecase
  final SignupUseCase signupUseCase;

  SignUpBloc(this.signupUseCase) : super(SignUpInitial());
}
