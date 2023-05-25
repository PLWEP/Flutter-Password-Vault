import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/detail_password_page.dart';
import 'package:pasword_vault/new_password_page.dart';
import 'package:pasword_vault/util/global_variable.dart';
import 'package:pasword_vault/util/provider_variable.dart';
import 'package:pasword_vault/util/result_state.dart';
import 'package:pasword_vault/widget/custom_password_box.dart';
import 'package:pasword_vault/widget/custom_title_text.dart';

class CategoryPage extends ConsumerWidget {
  final String title;
  const CategoryPage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(databasePasswordProvider);
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
                return NewPasswordPage();
              }),
            );
          }),
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
                child: Builder(
                  builder: (context) {
                    if (result.resultState == ResultState.loading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (result.resultState == ResultState.hasData) {
                      return ListView.builder(
                        itemCount: result.passwords!.length,
                        itemBuilder: (context, index) {
                          var password = result.passwords![index];
                          return CustomPasswordBox(
                            onpressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Detail Password'),
                                  content: DetailPasswordPage(
                                    title: password.title,
                                    password: password.password,
                                    username: password.username,
                                  ),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        fixedSize: MaterialStateProperty.all(
                                          const Size(double.maxFinite, 50),
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
                    } else if (result.resultState == ResultState.error) {
                      return Center(child: Text(result.message!));
                    } else if (result.resultState == ResultState.noData) {
                      return Center(child: Text(result.message!));
                    } else {
                      return const Material(
                        child: Text('Error found Try Again Later'),
                      );
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
