abstract class AuthState {}

class SignUpInitial extends AuthState {}

class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {}

class SignUpFailure extends AuthState {
  final String message;
  SignUpFailure(this.message);
}
