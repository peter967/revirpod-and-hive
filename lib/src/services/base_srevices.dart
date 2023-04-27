import 'package:hive/hive.dart';

class BaseServices {
  Future<CollectionBox<Map<dynamic, dynamic>>> getBox(String boxName) async {
    final collection = await BoxCollection.open('app', {boxName}, path: './');
    final box = await collection.openBox<Map>(boxName);
    return box;
  }
}
