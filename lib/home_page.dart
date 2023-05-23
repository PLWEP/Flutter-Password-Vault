import 'package:flutter/material.dart';
import 'package:pasword_vault/widget/custom_category_box.dart';

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
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            children: [
              CustomCategoryBox(
                title: "Server",
                icon: Icons.folder,
              ),
              CustomCategoryBox(
                title: "Banking",
                icon: Icons.money,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
