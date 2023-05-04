import 'package:get/get.dart';


import '../enum/e_cache_manager_key.enum.dart';
import '../interfaces/i_storage.interface.dart';
import '../services/storage.service.dart';

class CacheManagerProvider {
  final IStorageService storageService = Get.find<StorageService>();

  Future<bool> saveToken(String? token) async {
    await storageService.write(CacheManagerKey.TOKEN.toString(), token!);
    return true;
  }

  String? getToken() {
    return storageService.read(CacheManagerKey.TOKEN.toString());
  }

  Future<void> removeToken() async {
    await storageService.remove(CacheManagerKey.TOKEN.toString());
  }
}
