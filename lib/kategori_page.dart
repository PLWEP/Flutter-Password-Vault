import 'package:flutter/material.dart';

class KategoriPage extends StatelessWidget {
  const KategoriPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Password Kategori"),
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
      body: SafeArea(
        child: Column(
          children: [
            Text("Server"),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 75,
              decoration: BoxDecoration(
                color: Colors.black26,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "SSH Dev Server",
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "5-5-2023",
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 75,
              decoration: BoxDecoration(
                color: Colors.black26,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Web Sekolah",
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "5-5-2023",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
