///  contract that represents subclasses must add implementation to theses methods
///  that specific to storing locally with diffrent implemntation
abstract class StorageService {
  Future<void> save<T>(String key, T value);
}
