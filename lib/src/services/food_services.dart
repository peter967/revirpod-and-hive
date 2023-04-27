import 'package:flutter/material.dart';

import '../models/food.dart';
import 'base_srevices.dart';

class FoodServices extends BaseServices {
  static const boxName = 'food';

  Future<List<Food>> list() async {
    final box = await getBox(boxName);
    final items = await box.getAllValues();
    List<Food> foods = [];
    for (var entry in items.entries) {
      final Map<String, dynamic> data = {...entry.value, 'id': entry.key};
      foods.add(Food.fromJson(data));
      print(data);
    }

    return foods;
  }

  Future<bool> create(Food food) async {
    try {
      final box = await getBox(boxName);
      final id = UniqueKey().toString();
      //  (await box.getAllKeys()).length + 1;
      box.put(id, food.toJson());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> delete(String id) async {
    try {
      final box = await getBox(boxName);
      box.delete(id);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
