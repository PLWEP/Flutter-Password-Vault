class CategoryModel {
  String title;
  CategoryModel({
    required this.title,
  });

  CategoryModel copyWith({
    String? title,
  }) {
    return CategoryModel(
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      title: map['title'] as String,
    );
  }
}
