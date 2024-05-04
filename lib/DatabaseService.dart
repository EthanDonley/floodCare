import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class DatabaseService {
  Future<List<dynamic>> fetchData() async {
    var url = Uri.parse('https://flood-api.open-meteo.com/v1/flood?latitude=59.91&longitude=10.75&daily=river_discharge');

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // Assume data is directly a list for simplicity
        await writeFile(data);
        return data;
      } else {
        throw Exception('Failed to load data from API: Server returned ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('No Internet connection');
    } on HttpException {
      throw Exception('Could not find the data');
    } on FormatException {
      throw Exception('Bad response format');
    }
  }

  Future<void> writeFile(List<dynamic> data) async {
    final file = File('path/to/your/file.txt'); // Specify the file path
    await file.writeAsString(jsonEncode(data));
  }
}