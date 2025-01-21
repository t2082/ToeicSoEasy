// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class AuthEvent {}

class SignUpButtonPressed extends AuthEvent {
  final String email;
  final String password;
  final String displayName;
  SignUpButtonPressed(
      {required this.email, required this.password, required this.displayName});
}

class CreateAnAccountSubmitted extends AuthEvent {
  final String firstName;
  final String lastName;
  final String email;

  CreateAnAccountSubmitted(
      {required this.firstName, required this.lastName, required this.email});
}
class ChooseAPasswordSubmitted extends AuthEvent {
  final String password;
  ChooseAPasswordSubmitted({
    required this.password,
  });
}