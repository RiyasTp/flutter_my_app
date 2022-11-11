import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecuredStorage {
  //to singleton
  static final SecuredStorage instance = SecuredStorage._internal();
  factory SecuredStorage() {
    return instance;
  }
  SecuredStorage._internal();

// Create storage
  final storage = const FlutterSecureStorage();

// Write value
  void write(key, value) async {
    await storage.write(key: key, value: value);
  }

// Read value
  Future<String?> read(key) async {
    return await storage.read(key: key);
  }

// Delete value
  delete(key) async {
    await storage.delete(key: key);
  }
}
