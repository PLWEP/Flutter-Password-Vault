import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pasword_vault/widget/custom_icon_button.dart';

class CustomDetailPasswordBox extends StatefulWidget {
  final String title;
  final String data;
  const CustomDetailPasswordBox(
      {super.key, required this.title, required this.data});

  @override
  State<CustomDetailPasswordBox> createState() =>
      _CustomDetailPasswordBoxState();
}

class _CustomDetailPasswordBoxState extends State<CustomDetailPasswordBox> {
  bool passwordVisibility = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
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
                  passwordVisibility ? "*****" : "password",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                )),
                CustomIconButton(
                  onPressed: () async {
                    await Clipboard.setData(
                      ClipboardData(text: "password"),
                    );
                  },
                  icon: Icon(Icons.copy),
                ),
                SizedBox(width: 5),
                CustomIconButton(
                  onPressed: () {
                    setState(() {
                      passwordVisibility = !passwordVisibility;
                    });
                  },
                  icon: Icon(passwordVisibility
                      ? Icons.not_interested
                      : Icons.remove_red_eye),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
