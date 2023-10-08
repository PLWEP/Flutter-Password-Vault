import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/add_category_page.dart';
import 'package:pasword_vault/list_password_page.dart';
import 'package:pasword_vault/util/global_variable.dart';
import 'package:pasword_vault/util/provider_variable.dart';
import 'package:pasword_vault/widget/custom_category_box.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(databaseCategoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Category"),
      ),
      floatingActionButton: AddCategoryPage(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Builder(
            builder: (context) {
              if (result.resultState == ResultState.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (result.resultState == ResultState.hasData) {
                return ListView.builder(
                  itemCount: result.categories!.length,
                  itemBuilder: (context, index) {
                    var category = result.categories![index];
                    return CustomCategoryBox(
                      onpressed: () {
                        ref
                            .watch(categoryPageProvider.notifier)
                            .update((state) => category.title);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return ListPasswordPage(title: category.title);
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
                return const Material(
                  child: Text('Error found Try Again Later'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
