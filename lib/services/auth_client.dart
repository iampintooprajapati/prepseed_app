import "dart:convert";
import "package:http/http.dart" as http;

class AuthClient {
  static final AuthClient instance = AuthClient._internal();

  factory AuthClient() {
    return instance;
  }

  AuthClient._internal();

  Future<http.Response> doPost(String url, Map<String, dynamic> body,
      {Map<String, String>? header}) {
    Map<String, String> head = {
      "content-type": 'application/json',
      "Connection": "keep-alive"
    };
    String data = json.encode(body);
    return http.post(Uri.parse(url), body: jsonEncode(data), headers: head);
  }
}
