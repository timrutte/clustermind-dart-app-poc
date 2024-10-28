import 'dart:io' show Platform;

class Config {
  static String? get apiUrl {
    if (Platform.isAndroid) {
      return "https://h0koqxtxq9.execute-api.eu-west-1.amazonaws.com";  // return 'http://10.0.2.2:8088';
    } else {
      return "https://h0koqxtxq9.execute-api.eu-west-1.amazonaws.com"; // return 'http://127.0.0.1:8088';
    }
  }
}