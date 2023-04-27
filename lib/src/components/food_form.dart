import 'package:app/main.dart';
import 'package:app/src/providers/food_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FoodForm extends ConsumerWidget {
  const FoodForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(foodFormProvider.notifier);
    final food = ref.watch(foodFormProvider);
    return Container(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: provider.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Add Food',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                TextFormField(
                  controller: provider.nameController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    label: Text('Name'),
                  ),
                  validator: provider.nameValidator,
                ),
                const Divider(),
                ElevatedButton(
                  onPressed: () async {
                    final success = await provider.submit();
                    if (success == null) return;
                    if (success) {
                      rootScaffoldMessengerKey.currentState!.showSnackBar(
                        const SnackBar(
                          content: Text('Food Created'),
                        ),
                      );
                      // provider.clear();
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Create'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
