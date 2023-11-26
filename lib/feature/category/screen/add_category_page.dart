import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/feature/category/provider/category_provider.dart';
import 'package:pasword_vault/util/global_variable.dart';

class AddCategoryPage extends ConsumerStatefulWidget {
  const AddCategoryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddCategoryPageState();
}

class _AddCategoryPageState extends ConsumerState<AddCategoryPage> {
  final TextEditingController _titleController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void onSubmit() {
    ref
        .read(categoryControllerProvider.notifier)
        .addCategory(context, _titleController.text.trim());
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('New Category'),
            content: Form(
              key: _formKey,
              child: TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Category Name',
                ),
                validator: (value) => value!.isEmpty ? nullErrorMessage : null,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(
                    const Size(double.maxFinite, 50),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    onSubmit();
                    _formKey.currentState!.reset();
                  }
                },
                child: const Text("Add"),
              ),
            ],
          ),
        );
      },
    );
  }
}
