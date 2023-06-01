import 'dart:typed_data';

class EncryptedModel {
  Uint8List byte;
  String data;
  EncryptedModel({
    required this.byte,
    required this.data,
  });

  EncryptedModel copyWith({
    Uint8List? byte,
    String? data,
  }) {
    return EncryptedModel(
      byte: byte ?? this.byte,
      data: data ?? this.data,
    );
  }
}
