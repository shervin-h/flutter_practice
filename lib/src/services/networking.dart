import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future getData() async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      }
    } catch (e) {
      // 😦
      throw e.toString();
    }
  }

  Future postData (Map<String, String>? headers, Object? body) async {
    try {
      http.Response response = await http.post(Uri.parse(url), headers: headers, body: body);
      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      }
    } catch (e) {
      // 😦
      throw e.toString();
    }
  }
}