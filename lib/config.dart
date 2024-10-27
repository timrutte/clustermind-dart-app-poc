import 'dart:io' show Platform;

class Config {
  static String get apiUrl {
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:8088/nodes';
    } else {
      return 'http://127.0.0.1:8088/nodes';
    }
  }
}