import 'package:app/src/models/food.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FoodCard extends ConsumerWidget {
  final Food food;
  const FoodCard(this.food, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: const Icon(Icons.star),
      title: Text(food.name),
      subtitle: Text(food.caption),
    );
  }
}
