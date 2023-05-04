abstract class IStorageService {
  Future<void> write(String key, String value);
  T read<T>(String key);
  Future<void> remove(String key);

  Future<IStorageService> init();
}
