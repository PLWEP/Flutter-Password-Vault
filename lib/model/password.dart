class PasswordModel {
  int id;
  String title;
  String username;
  String password;
  String date;
  String category;
  PasswordModel({
    required this.id,
    required this.title,
    required this.username,
    required this.password,
    required this.date,
    required this.category,
  });

  PasswordModel copyWith({
    int? id,
    String? title,
    String? username,
    String? password,
    String? date,
    String? category,
  }) {
    return PasswordModel(
      id: id ?? this.id,
      title: title ?? this.title,
      username: username ?? this.username,
      password: password ?? this.password,
      date: date ?? this.date,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'username': username,
      'password': password,
      'date': date,
      'category': category,
    };
  }

  factory PasswordModel.fromMap(Map<String, dynamic> map) {
    return PasswordModel(
      id: map['id'] as int,
      title: map['title'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
      date: map['date'] as String,
      category: map['category'] as String,
    );
  }

  @override
  String toString() {
    return 'PasswordModel(id: $id, title: $title, username: $username, password: $password, date: $date, category: $category)';
  }

  @override
  bool operator ==(covariant PasswordModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.username == username &&
        other.password == password &&
        other.date == date &&
        other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        username.hashCode ^
        password.hashCode ^
        date.hashCode ^
        category.hashCode;
  }
}
