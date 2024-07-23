import 'package:poke_teste/app/domains/enums/storage_keys_enum.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageService {
  late Box _dataBox;

  Future<void> startLocalStorageBox() async {
    await Hive.initFlutter();
    _dataBox = await Hive.openBox('db');
  }

  getFieldValue(StorageKeysEnum fieldName) {
    return _dataBox.get(fieldName.getString);
  }

  getFieldValueAsDynamic(StorageKeysEnum fieldName) {
    return _dataBox.get(fieldName.getString);
  }

  Future<void> setFieldValueAsDynamic(
    StorageKeysEnum fieldName,
    dynamic fieldValue,
  ) async {
    await _dataBox.put(fieldName.getString, fieldValue);
  }

  Future<void> setFieldValue(
    StorageKeysEnum fieldName,
    String? fieldValue,
  ) async {
    await _dataBox.put(fieldName.getString, fieldValue);
  }

  Future<void> deleteField(StorageKeysEnum fieldName) async {
    await _dataBox.delete(fieldName.getString);
  }

  Future<void> clear() async {
    _dataBox.clear();
  }
}
