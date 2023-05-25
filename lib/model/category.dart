class CategoryModel {
  int id;
  String title;
  CategoryModel({
    required this.id,
    required this.title,
  });

  CategoryModel copyWith({
    int? id,
    String? title,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as int,
      title: map['title'] as String,
    );
  }

  @override
  String toString() => 'Category(id: $id, title: $title)';

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}
