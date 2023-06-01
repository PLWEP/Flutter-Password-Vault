import 'dart:typed_data';

class PasswordModel {
  String title;
  String username;
  String password;
  Uint8List byte;
  String date;
  String category;
  PasswordModel({
    required this.title,
    required this.username,
    required this.password,
    required this.byte,
    required this.date,
    required this.category,
  });

  PasswordModel copyWith({
    String? title,
    String? username,
    String? password,
    Uint8List? byte,
    String? date,
    String? category,
  }) {
    return PasswordModel(
      title: title ?? this.title,
      username: username ?? this.username,
      password: password ?? this.password,
      byte: byte ?? this.byte,
      date: date ?? this.date,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'username': username,
      'password': password,
      'byte': byte,
      'date': date,
      'category': category,
    };
  }

  factory PasswordModel.fromMap(Map<String, dynamic> map) {
    return PasswordModel(
      title: map['title'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
      byte: map['byte'] as Uint8List,
      date: map['date'] as String,
      category: map['category'] as String,
    );
  }
}
