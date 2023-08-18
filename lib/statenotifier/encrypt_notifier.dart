import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:pasword_vault/model/encrypted_model.dart';

class EncryptNotifier extends StateNotifier<String> {
  EncryptNotifier() : super('');
  static final key = encrypt.Key.fromLength(32);
  static final iv = encrypt.IV.fromLength(8);
  final encrypter = encrypt.Encrypter(encrypt.Salsa20(key));

  EncryptedModel encryptMessage(String message) {
    final encryptedMessage = encrypter.encrypt(message, iv: iv);
    return EncryptedModel(
        byte: encryptedMessage.bytes, data: encryptedMessage.base16);
  }

  String decryptMessage(Uint8List encryptedMessage) {
    final message = encrypt.Encrypted(encryptedMessage);
    final originalMessage = encrypter.decrypt(message, iv: iv);
    return originalMessage;
  }
}
