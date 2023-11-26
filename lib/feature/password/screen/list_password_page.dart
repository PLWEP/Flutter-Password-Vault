import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/common/widget/loader.dart';
import 'package:pasword_vault/feature/password/provider/password_provider.dart';
import 'package:pasword_vault/feature/password/screen/add_password_page.dart';
import 'package:pasword_vault/feature/password/screen/detail_password_page.dart';
import 'package:pasword_vault/common/global_variable.dart';
import 'package:pasword_vault/widget/custom_password_box.dart';
import 'package:pasword_vault/widget/custom_title_text.dart';

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
        title: const Text("List Password"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const AddPasswordPage();
            }),
          );
        },
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            children: [
              CustomTitleText(
                title: title,
                textStyle: heading1Style,
              ),
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
                                        title: const Text('Detail Password'),
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
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
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
                            return const Center(child: Text("Kosong Bro"));
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
