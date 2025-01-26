// ignore_for_file: annotate_overrides

import 'package:hive_flutter/hive_flutter.dart';
import 'package:titipbarang_app/data/local/hive/fields/storage_field.dart';
import 'package:titipbarang_app/data/local/hive/hive_adapters.dart';
import 'package:titipbarang_app/data/local/hive/hive_types.dart';

part 'storage.g.dart';

@HiveType(typeId: HiveTypes.storage, adapterName: HiveAdapters.storage)
class Storage extends HiveObject {
  Storage({
    required this.key,
    required this.value,
    this.expiredDate,
  });

  @HiveField(StorageFields.key)
  final String key;
  @HiveField(StorageFields.value)
  final dynamic value;
  @HiveField(StorageFields.expiredDate)
  final DateTime? expiredDate;
}
