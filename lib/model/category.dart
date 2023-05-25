class Category {
  int id;
  String title;
  Category({
    required this.id,
    required this.title,
  });

  Category copyWith({
    int? id,
    String? title,
  }) {
    return Category(
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

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int,
      title: map['title'] as String,
    );
  }

  @override
  String toString() => 'Category(id: $id, title: $title)';

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}
