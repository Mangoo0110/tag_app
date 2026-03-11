class AuthUser {
  const AuthUser({
    required this.id,
    required this.email,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.imageUrl,

  });

  final int id;
  final String email;
  final String username;
  final String firstName;
  final String lastName;
  final String phone;
  final String? imageUrl;

  String get fullName => '$firstName $lastName'.trim();
}
