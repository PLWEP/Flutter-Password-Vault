import 'package:flutter/material.dart';
import 'package:pasword_vault/detail_password_page.dart';
import 'package:pasword_vault/new_password_page.dart';
import 'package:pasword_vault/util/global_variable.dart';
import 'package:pasword_vault/widget/custom_password_box.dart';
import 'package:pasword_vault/widget/custom_title_text.dart';

class CategoryPage extends StatelessWidget {
  final String title;
  const CategoryPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
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
                return const NewPasswordPage();
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
              CustomPasswordBox(
                title: "SSH",
                date: "5-5-2022",
                onpressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Detail Password'),
                      content: const DetailPasswordPage(),
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
              ),
              CustomPasswordBox(
                title: "School Website",
                date: "5-5-2022",
                onpressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Detail Password'),
                      content: const DetailPasswordPage(),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
