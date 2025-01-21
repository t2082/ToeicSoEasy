// Clean Architecture:
// 1. Thêm Entity <-
// 2. Thêm Repository (abstract)

class User {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });
}
