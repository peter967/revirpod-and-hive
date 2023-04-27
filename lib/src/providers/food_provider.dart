import 'package:app/src/models/food.dart';
import 'package:app/src/services/food_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum FoodListType {
  all,
}

class FoodListProvider extends StateNotifier<List<Food>> {
  final FoodListType type;
  final Ref ref;
  FoodListProvider(this.type, this.ref, [List<Food> initial = const []])
      : super(initial) {
    init();
  }

  init() async {
    final items = await FoodServices().list();
    state = items;
  }

  append(Food food) async {
    state = [...state, food];
  }

  remove(int i) async {
    state = [...state]..removeAt(i);
  }
}

final foodListProvider =
    StateNotifierProvider.family<FoodListProvider, List<Food>, FoodListType>(
        (ref, type) {
  return FoodListProvider(
    type,
    ref,
  );
});
