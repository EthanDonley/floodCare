import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  Future<Map<String, dynamic>> fetchRiverDischargeData() async {
    Uri url = Uri.parse('https://flood-api.open-meteo.com/v1/flood?latitude=59.91&longitude=10.75&daily=river_discharge');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // Decode the JSON response into a Map
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      print('Decoded data: $data'); // This helps you see the decoded structure
      // Directly return the decoded Map
      return data;
    } else {
      // If the status code is not 200, throw an exception with the status code
      throw Exception('Failed to load data from API: Server returned ${response.statusCode}');
    }
  }
}