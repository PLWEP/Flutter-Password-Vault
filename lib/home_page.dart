import 'package:flutter/material.dart';
import 'package:pasword_vault/category_page.dart';
import 'package:pasword_vault/widget/custom_category_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _categoryController = TextEditingController();

  @override
  void dispose() {
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('New Category'),
            content: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter category',
              ),
              controller: _categoryController,
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(
                    const Size(double.maxFinite, 50),
                  ),
                ),
                onPressed: () {},
                child: const Text("Add"),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            children: [
              CustomCategoryBox(
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const CategoryPage(title: "Server");
                    }),
                  );
                },
                title: "Server",
                icon: Icons.folder,
              ),
              CustomCategoryBox(
                title: "Banking",
                icon: Icons.money,
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const CategoryPage(
                        title: "Banking",
                      );
                    }),
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
