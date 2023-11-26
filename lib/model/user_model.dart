class UserModel {
  String name;
  String password;
  UserModel({
    required this.name,
    required this.password,
  });

  UserModel copyWith({
    String? name,
    String? password,
  }) {
    return UserModel(
      name: name ?? this.name,
      password: password ?? this.password,
    );
  }
}
