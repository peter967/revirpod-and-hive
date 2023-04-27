import 'package:app/src/components/food_form.dart';
import 'package:app/src/components/food_list.dart';
import 'package:app/src/providers/food_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FoodListScreen extends ConsumerWidget {
  const FoodListScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food'),
      ),
      body: const FoodList(
        type: FoodListType.all,
      ),
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: Colors.amber,
        onPressed: () async {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return const FoodForm();
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
