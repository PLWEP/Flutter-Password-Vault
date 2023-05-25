class PasswordModel {
  int id;
  String title;
  String username;
  String password;
  PasswordModel({
    required this.id,
    required this.title,
    required this.username,
    required this.password,
  });

  PasswordModel copyWith({
    int? id,
    String? title,
    String? username,
    String? password,
  }) {
    return PasswordModel(
      id: id ?? this.id,
      title: title ?? this.title,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'username': username,
      'password': password,
    };
  }

  factory PasswordModel.fromMap(Map<String, dynamic> map) {
    return PasswordModel(
      id: map['id'] as int,
      title: map['title'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  @override
  String toString() {
    return 'Password(id: $id, title: $title, username: $username, password: $password)';
  }

  @override
  bool operator ==(covariant PasswordModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.username == username &&
        other.password == password;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ username.hashCode ^ password.hashCode;
  }
}
