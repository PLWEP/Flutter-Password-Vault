import 'package:flutter/material.dart';

class DetailPasswordPage extends StatelessWidget {
  const DetailPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Password"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("SSH Dev Server"),
          Text("Username"),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Text("Username"),
          ),
          Text("Password"),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Row(
              children: [
                Expanded(child: Text("password")),
                Icon(Icons.copy),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.remove_red_eye),
              ],
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(
                Size(double.maxFinite, 50),
              ),
            ),
            onPressed: () {},
            child: Text("Tambahkan"),
          ),
        ],
      ),
    );
  }
}
