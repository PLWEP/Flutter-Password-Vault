class AccountModel {
  String name;
  String password;
  AccountModel({
    required this.name,
    required this.password,
  });

  AccountModel copyWith({
    String? name,
    String? password,
  }) {
    return AccountModel(
      name: name ?? this.name,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'password': password,
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      name: map['name'] as String,
      password: map['password'] as String,
    );
  }
}
