import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      // ignore: deprecated_member_use
      encryptedSharedPreferences: true,
    ),
  );
  Future saveToken({required String token}) async {
    await storage.write(key: 'token', value: token);
  }

  Future<String> getToken() async {
    final String token = await storage.read(key: 'token') ?? '';
    return token;
  }

  Future removeToken() async {
    await storage.delete(key: 'token');
  }
}