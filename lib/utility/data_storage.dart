import 'dart:developer';

import 'package:get_storage/get_storage.dart';

class DataStorage {
  static init() async {
    await GetStorage.init('main');
  }

  static final box = GetStorage('main');

  static void store(String key, dynamic value) {
    log('store: $key, $value');
    box.write(key, value);
  }

  static dynamic retrieve(String key) {
    var value = box.read(key);
    return value;
  }

  static T? retrieveModel<T>(
      String key, T Function(Map<String, dynamic>) fromJson) {
    final json = box.read(key) as Map<String, dynamic>?;
    return json != null ? fromJson(json) : null;
  }

  static bool contains(String key) {
    return box.hasData(key);
  }

  static void remove(String key) {
    box.remove(key);
  }

  static void clear() {
    String? local = DataStorage.retrieve('local');
    box.erase();
    if (local != null) {
      DataStorage.store('local', local);
    }
  }

  static listenKey(String key, Function(dynamic) callback) {
    box.listenKey(key, callback);
  }
}
