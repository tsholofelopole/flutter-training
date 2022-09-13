import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future<dynamic> getWeatherData() async {

    http.Response response = await http.get(url);
    print('Response: $response');
    print('Response body:' + response.body);

    if(response.statusCode.clamp(200, 299) == response.statusCode) {
      return jsonDecode(response.body);
    } else {
      print('InValid response received');
    }

  }
}