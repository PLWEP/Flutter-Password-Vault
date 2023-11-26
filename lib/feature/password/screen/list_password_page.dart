import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/common/widget/empty_text.dart';
import 'package:pasword_vault/common/widget/loader.dart';
import 'package:pasword_vault/feature/password/provider/password_provider.dart';
import 'package:pasword_vault/feature/password/screen/add_password_page.dart';
import 'package:pasword_vault/feature/password/screen/detail_password_page.dart';
import 'package:pasword_vault/feature/password/widget/custom_password_box.dart';

class ListPasswordPage extends ConsumerWidget {
  final String title;
  const ListPasswordPage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(passwordControllerProvider);
    final result = ref.watch(passwordProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List $title Password",
          style: const TextStyle(overflow: TextOverflow.fade),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddPasswordPage(),
            ),
          );
        },
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            children: [
              Expanded(
                child: isLoading
                    ? const Loader()
                    : Builder(
                        builder: (context) {
                          if (result.isNotEmpty) {
                            return ListView.builder(
                              itemCount: result.length,
                              itemBuilder: (context, index) {
                                var password = result[index];
                                return CustomPasswordBox(
                                  onpressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: Text(
                                            'Detail Password ${password.title}'),
                                        content: DetailPasswordPage(
                                          title: password.title,
                                          password: password.password,
                                          username: password.username,
                                          byte: password.byte,
                                        ),
                                        actions: <Widget>[
                                          ElevatedButton(
                                            style: ButtonStyle(
                                              fixedSize:
                                                  MaterialStateProperty.all(
                                                const Size(
                                                    double.maxFinite, 50),
                                              ),
                                            ),
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                            child: const Text("Close"),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  title: password.title,
                                  date: password.date,
                                );
                              },
                            );
                          } else {
                            return const EmptyText();
                          }
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
