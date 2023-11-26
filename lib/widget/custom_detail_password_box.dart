import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/common/provider_variable.dart';
import 'package:pasword_vault/widget/custom_icon_button.dart';

class CustomDetailPasswordBox extends ConsumerWidget {
  final String title;
  final Uint8List data;
  const CustomDetailPasswordBox({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final decryptedData = ref.watch(encryptProvider).decryptMessage(data);
    final passwordVisibility = ref.watch(passwordVisibilityProvider);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            margin: const EdgeInsets.only(bottom: 15),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  passwordVisibility ? decryptedData : "*****",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                )),
                CustomIconButton(
                  onPressed: () async {
                    await Clipboard.setData(
                      ClipboardData(text: decryptedData),
                    );
                  },
                  icon: const Icon(Icons.copy),
                ),
                const SizedBox(width: 5),
                CustomIconButton(
                  onPressed: () => ref
                      .read(passwordVisibilityProvider.notifier)
                      .update((state) => !passwordVisibility),
                  icon: Icon(passwordVisibility
                      ? Icons.remove_red_eye
                      : Icons.not_interested),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
