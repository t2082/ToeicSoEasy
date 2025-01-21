abstract class SignUpEvent {}

class SignUpButtonPressed extends SignUpEvent {
  final String email;
  final String password;
  final String displayName;

  SignUpButtonPressed({required this.email, required this.password, required this.displayName});
  
}