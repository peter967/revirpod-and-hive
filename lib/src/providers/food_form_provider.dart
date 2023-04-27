import 'package:app/src/models/food.dart';
import 'package:app/src/providers/food_provider.dart';
import 'package:app/src/services/food_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FoodFormNotifier extends StateNotifier<Food> {
  final Ref ref;
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  FoodFormNotifier(this.ref, Food model) : super(model) {
    load(model);
    addListeners();
  }
  load(Food food) {
    state = food;
    nameController.text = food.name;
  }

  clear() {
    load(Food.empty());
  }

  addListeners() {
    nameController.addListener(() {
      state = state.copyWith(name: nameController.text);
    });
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }

    return null;
  }

  Future<bool?> submit() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }
    final success = await FoodServices().create(state);
    if (success) {
      ref.read(foodListProvider(FoodListType.all).notifier).append(state);
      clear();

      return true;
    }
    return false;
  }
}

final foodFormProvider = StateNotifierProvider<FoodFormNotifier, Food>((ref) {
  return FoodFormNotifier(ref, Food.empty());
});
