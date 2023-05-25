class Password {
  int id;
  String title;
  String password;
  Password({
    required this.id,
    required this.title,
    required this.password,
  });

  Password copyWith({
    int? id,
    String? title,
    String? password,
  }) {
    return Password(
      id: id ?? this.id,
      title: title ?? this.title,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'password': password,
    };
  }

  factory Password.fromMap(Map<String, dynamic> map) {
    return Password(
      id: map['id'] as int,
      title: map['title'] as String,
      password: map['password'] as String,
    );
  }

  @override
  String toString() => 'Password(id: $id, title: $title, password: $password)';

  @override
  bool operator ==(covariant Password other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title && other.password == password;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ password.hashCode;
}
