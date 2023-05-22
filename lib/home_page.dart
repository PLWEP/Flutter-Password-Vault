import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _kategoriController = TextEditingController();

  @override
  void dispose() {
    _kategoriController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kategori"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Kategori Baru'),
            content: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter kategori',
              ),
              controller: _kategoriController,
            ),
            actions: <Widget>[
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
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
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
              child: Row(
                children: [
                  Icon(Icons.folder),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Server"),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 75,
              decoration: BoxDecoration(
                color: Colors.black26,
              ),
              child: Row(
                children: [
                  Icon(Icons.monetization_on),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Banking"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
