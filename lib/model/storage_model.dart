class StorageModel {
  String name;
  String password;
  StorageModel({
    required this.name,
    required this.password,
  });

  StorageModel copyWith({
    String? name,
    String? password,
  }) {
    return StorageModel(
      name: name ?? this.name,
      password: password ?? this.password,
    );
  }
}
