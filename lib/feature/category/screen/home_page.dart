import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasword_vault/common/widget/empty_text.dart';
import 'package:pasword_vault/common/widget/loader.dart';
import 'package:pasword_vault/feature/category/provider/category_provider.dart';
import 'package:pasword_vault/feature/category/screen/add_category_page.dart';
import 'package:pasword_vault/feature/password/provider/password_provider.dart';
import 'package:pasword_vault/feature/password/screen/list_password_page.dart';

import 'package:pasword_vault/feature/category/widget/custom_category_box.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final result = ref.watch(categoryProvider);
    final isLoading = ref.watch(categoryControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Category List"),
        centerTitle: true,
      ),
      floatingActionButton: const AddCategoryPage(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: isLoading
              ? const Loader()
              : Builder(
                  builder: (context) {
                    if (result.isNotEmpty) {
                      return ListView.builder(
                        itemCount: result.length,
                        itemBuilder: (context, index) {
                          var category = result[index];
                          return CustomCategoryBox(
                            onpressed: () {
                              ref
                                  .read(selectedCategoryProvider.notifier)
                                  .update((state) => category.title);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ListPasswordPage(
                                        title: category.title);
                                  },
                                ),
                              );
                            },
                            title: category.title,
                            icon: Icons.folder,
                          );
                        },
                      );
                    } else {
                      return const EmptyText();
                    }
                  },
                ),
        ),
      ),
    );
  }
}
