import 'package:flutter/material.dart';
import 'package:pasword_vault/common/global_variable.dart';

class EmptyText extends StatelessWidget {
  const EmptyText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.not_interested),
          SizedBox(height: 15),
          Text(emptyData),
        ],
      ),
    );
  }
}
