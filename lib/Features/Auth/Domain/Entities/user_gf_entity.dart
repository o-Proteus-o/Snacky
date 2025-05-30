class UserGFEntity {
  final String name;
  final String email;
  final String? password;
  final String? profilePictureUrl;

  UserGFEntity({
    required this.name,
    required this.email,
    this.password,
    this.profilePictureUrl,
  });

  @override
  String toString() {
    return ' name: $name, email: $email, phoneNumber: $password, profilePictureUrl: $profilePictureUrl)';
  }
}
