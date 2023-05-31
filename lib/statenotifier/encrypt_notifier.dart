import 'package:easy_encryption/easy_encryption.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EncryptNotifier extends StateNotifier<String> {
  final EasyEncryption easyEncryption;

  EncryptNotifier({required this.easyEncryption}) : super('');

  Future<String> encryptMessage(String message) async {
    String encryptedMessage = await easyEncryption.encryptData(data: message);
    return encryptedMessage;
  }

  Future<String> decryptMessage(String encryptedMessage) async {
    final originalMessage =
        await easyEncryption.decryptData(data: encryptedMessage);
    return originalMessage;
  }
}
