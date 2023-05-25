import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/category_page.dart';
import 'package:pasword_vault/util/provider_variable.dart';
import 'package:pasword_vault/util/result_state.dart';
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
          child: Consumer(
            builder: (context, ref, child) {
              final result = ref.watch(databaseProvider);
              if (result.resultState == ResultState.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (result.resultState == ResultState.hasData) {
                return ListView.builder(
                  itemCount: result.categories!.length,
                  itemBuilder: (context, index) {
                    var category = result.categories![index];
                    return CustomCategoryBox(
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return CategoryPage(title: category.title);
                          }),
                        );
                      },
                      title: category.title,
                      icon: Icons.folder,
                    );
                  },
                );
              } else if (result.resultState == ResultState.error) {
                return Center(child: Text(result.message!));
              } else if (result.resultState == ResultState.noData) {
                return Center(child: Text(result.message!));
              } else {
                return const Material(child: Text(''));
              }
            },
          ),
        ),
      ),
    );
  }
}
