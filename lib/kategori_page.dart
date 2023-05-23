import 'package:flutter/material.dart';
import 'package:pasword_vault/detail_password_page.dart';
import 'package:pasword_vault/new_password_page.dart';
import 'package:pasword_vault/widget/custom_detail_password_box.dart';
import 'package:pasword_vault/widget/custom_detail_username_box.dart';
import 'package:pasword_vault/widget/custom_heading1_text.dart';
import 'package:pasword_vault/widget/custom_password_box.dart';

class KategoriPage extends StatelessWidget {
  final String title;
  const KategoriPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Password"),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
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
          margin: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            children: [
              CustomHeading1Text(title: title),
              CustomPasswordBox(
                title: "SSH",
                date: "5-5-2022",
                onpressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Detail Password'),
                      content: DetailPasswordPage(),
                      actions: <Widget>[
                        ElevatedButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(
                              Size(double.maxFinite, 50),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Tutup"),
                        ),
                      ],
                    ),
                  );
                },
              ),
              CustomPasswordBox(
                title: "Web Sekolah",
                date: "5-5-2022",
                onpressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Detail Password'),
                      content: DetailPasswordPage(),
                      actions: <Widget>[
                        ElevatedButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(
                              Size(double.maxFinite, 50),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Tutup"),
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
