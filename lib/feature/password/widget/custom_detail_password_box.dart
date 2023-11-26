import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/common/provider_variable.dart';
import 'package:pasword_vault/feature/password/widget/custom_icon_button.dart';

class CustomDetailPasswordBox extends ConsumerStatefulWidget {
  final Uint8List data;
  final String password;
  const CustomDetailPasswordBox({
    super.key,
    required this.data,
    required this.password,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomDetailPasswordBoxState();
}

class _CustomDetailPasswordBoxState
    extends ConsumerState<CustomDetailPasswordBox> {
  bool passwordVisibility = false;
  @override
  Widget build(BuildContext context) {
    final decryptedData =
        ref.watch(encryptProvider).decryptMessage(widget.data);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Password",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(border: Border.all()),
            margin: const EdgeInsets.only(bottom: 15),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    passwordVisibility ? decryptedData : widget.password,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                CustomIconButton(
                  onPressed: () async => await Clipboard.setData(
                    ClipboardData(text: decryptedData),
                  ),
                  icon: const Icon(Icons.copy),
                ),
                const SizedBox(width: 5),
                CustomIconButton(
                  onPressed: () {
                    setState(() {
                      passwordVisibility = !passwordVisibility;
                    });
                  },
                  icon: Icon(
                    passwordVisibility
                        ? Icons.remove_red_eye
                        : Icons.not_interested,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
