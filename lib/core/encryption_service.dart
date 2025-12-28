import 'dart:convert';
import 'dart:math';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class EncryptionService {
  static const _storage = FlutterSecureStorage();
  static const _keyParams = 'db_key';

  /// Recupera la chiave di crittografia o ne genera una nuova se non esiste.
  static Future<String> getDatabaseKey() async {
    String? encryptionKey = await _storage.read(key: _keyParams);

    if (encryptionKey == null) {
      // Genera una chiave casuale sicura
      final key = List<int>.generate(32, (i) => Random.secure().nextInt(256));
      encryptionKey = base64UrlEncode(key);
      
      // Salva nella secure storage
      await _storage.write(key: _keyParams, value: encryptionKey);
    }
    
    return encryptionKey;
  }
}
