// import 'package:encrypt/encrypt.dart' as encrypt;
// import 'package:flutter/services.dart';
// // import 'package:flutter/material.dart';
//
// class EncryptionUtils {
//
//   static final _key = encrypt.Key.fromUtf8("1234567812345678");
//   static final _iv = encrypt.IV.fromUtf8("1234567812345678");
//
//   static const bool _encryptionEnabled = true;
//
//   static final _encrypter = encrypt.Encrypter(encrypt.AES(_key, mode: encrypt.AESMode.cbc, padding: 'PKCS7'));
//
//   static String getEncryptedText(String plainText) {
//     try {
//       if (_encryptionEnabled) {
//         // final String encrypted = _encrypter.encrypt(plainText).base64;
//         final String encrypted = _encrypter.encrypt(plainText, iv: _iv).base64;
//         return encrypted;
//       } else {
//         return plainText;
//       }
//     } on PlatformException catch (_) {
//       return plainText;
//     }
//   }
//
//   static String getDecrypted(String encryptedText) {
//     try {
//       if (_encryptionEnabled) {
//         final decrypted = _encrypter.decrypt(
//             // encrypt.Encrypted.from64(encryptedText));
//             encrypt.Encrypted.from64(encryptedText), iv: _iv);
//         return decrypted;
//       } else {
//         return encryptedText;
//       }
//     } on PlatformException catch (_) {
//       return encryptedText;
//     }
//   }
//
// }