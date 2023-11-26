import 'dart:typed_data';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:pasword_vault/model/encrypted_model.dart';

class EncryptHelper {
  EncryptHelper();
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
