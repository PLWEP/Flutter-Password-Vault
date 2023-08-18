import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/model/category_model.dart';
import 'package:pasword_vault/util/global_variable.dart';
import 'package:pasword_vault/util/provider_variable.dart';

class AddCategoryPage extends ConsumerWidget {
  AddCategoryPage({super.key});

  void onSubmit(WidgetRef ref) {
    final title = ref.read(categoryDumbProvider);
    ref
        .read(databaseCategoryProvider.notifier)
        .addCategory(CategoryModel(title: title));
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter category',
                ),
                validator: (value) => value!.isEmpty ? nullErrorMessage : null,
                onChanged: (value) => ref
                    .read(categoryDumbProvider.notifier)
                    .update((state) => value),
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
                    onSubmit(ref);
                    Navigator.pop(context);
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
