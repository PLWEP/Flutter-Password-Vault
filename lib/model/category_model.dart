class CategoryModel {
  String title;
  int userId;
  CategoryModel({
    required this.title,
    required this.userId,
  });

  CategoryModel copyWith({
    String? title,
    int? userId,
  }) {
    return CategoryModel(
      title: title ?? this.title,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'userId': userId,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      title: map['title'] as String,
      userId: map['userId'] as int,
    );
  }
}
