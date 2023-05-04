import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../interfaces/i_storage.interface.dart';

class StorageService extends GetxService implements IStorageService {
  late GetStorage _box;

  @override
  Future<StorageService> init() async {
    _box = GetStorage();

    await _box.writeIfNull('app', []);
    return this;
  }

  @override
  T read<T>(String key) => _box.read(key);

  @override
  Future<void> write(String key, String value) async => await _box.write(key, value);

  @override
  Future<void> remove(String key) async => await _box.remove(key);
}
