import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pasword_vault/feature/auth/controller/storage_controller.dart';
import 'package:pasword_vault/feature/auth/repository/storage_repository.dart';
import 'package:pasword_vault/model/user_model.dart';

final userProvider = StateProvider<UserModel?>((ref) => null);

final storageControllerProvider =
    StateNotifierProvider<StorageController, bool>(
  (ref) {
    final storageRepository = ref.watch(storageRepositoryProvider);
    return StorageController(
      ref: ref,
      storageRepository: storageRepository,
    );
  },
);

final storageRepositoryProvider = Provider(
  (ref) => StorageRepository(
    storageHelper: ref.watch(flutterStorageProvider),
  ),
);

final flutterStorageProvider = Provider((ref) => const FlutterSecureStorage());
final loginStatusProvider = StateProvider.autoDispose<bool>((ref) => false);
