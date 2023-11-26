import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/common/database_helper.dart';
import 'package:pasword_vault/common/encrypt_helper.dart';

final passwordVisibilityProvider =
    StateProvider.autoDispose<bool>((ref) => false);

final encryptProvider = Provider((ref) => EncryptHelper());

final databaseHelperProvider = Provider(
  (ref) => DatabaseHelper(),
);
