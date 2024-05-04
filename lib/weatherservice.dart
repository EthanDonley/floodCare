import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  Future<List<Map<String, dynamic>>> fetchRiverDischargeData() async {
    Uri url = Uri.parse('https://flood-api.open-meteo.com/v1/flood?latitude=59.91&longitude=10.75&daily=river_discharge');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // Assuming the response is plain text CSV
      return parseCsv(response.body);
    } else {
      throw Exception('Failed to load data from API: Server returned ${response.statusCode}');
    }
  }

  List<Map<String, dynamic>> parseCsv(String data) {
    List<Map<String, dynamic>> resultList = [];
    List<String> lines = data.split('\n');
    List<String> headers = lines[0].split(',');

    for (var i = 1; i < lines.length; i++) {
      Map<String, dynamic> row = {};
      List<String> rowValues = lines[i].split(',');

      for (var j = 0; j < headers.length; j++) {
        row[headers[j]] = rowValues[j];
      }

      resultList.add(row);
    }

    return resultList;
  }
}