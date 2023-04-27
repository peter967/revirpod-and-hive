// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/src/components/food_card.dart';
import 'package:app/src/services/food_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app/src/providers/food_provider.dart';

class FoodList extends ConsumerWidget {
  final FoodListType type;
  const FoodList({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foods = ref.watch(foodListProvider(FoodListType.all));
    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (context, i) {
        final food = foods[i];
        return Container(
          color: Colors.red.shade400,
          child: Dismissible(
            key: Key(food.id),
            direction: DismissDirection.endToStart,
            onDismissed: (_) async {
              await FoodServices().delete(food.id);
              ref.read(foodListProvider(type).notifier).remove(i);
            },
            child: Container(
              color: Colors.white,
              child: FoodCard(food),
            ),
          ),
        );
      },
    );
  }
}
