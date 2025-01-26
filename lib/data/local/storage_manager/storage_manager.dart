import 'package:hive_flutter/hive_flutter.dart';
import 'package:titipbarang_app/model/storage/storage.dart';

class StorageManager {
  factory StorageManager.getInstance() => _instance;

  StorageManager._internal() : _box = Hive.box<Storage>((Storage).toString());

  static final StorageManager _instance = StorageManager._internal();

  final Box<Storage> _box;

  Future<void> save(Storage storage) => _box.put(storage.key, storage);

  Storage? get(String key) => _box.get(key);

  Future<void> removeStorage(String key) => _box.delete(key);

  bool containsStorage(String key) => _box.containsKey(key);

  Future<void> clearAllStorage() => _box.clear();

  List<Storage> getAllStorage() => _box.values.toList();

  bool isEmpty() => _box.isEmpty;

  Iterable<dynamic> keys() => _box.keys;
}
