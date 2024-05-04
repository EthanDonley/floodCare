import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async'; // For retry logic

Future<http.Response> fetchWithRetry(Uri url, {int retries = 3}) async {
  int attempt = 0;
  while (attempt < retries) {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      if (attempt == retries - 1) {
        rethrow; // Throw error after last retry
      }
      attempt++;
      await Future.delayed(Duration(seconds: 2)); // Wait before retry
    }
  }
  return Future.error('Failed to fetch data after retries');
}

// Usage of fetchWithRetry
Future<void> fetchData() async {
  Uri url = Uri.parse("https://flood-api.open-meteo.com/v1/flood?latitude=59.91&longitude=10.75&daily=river_discharge");
  try {
    http.Response response = await fetchWithRetry(url);
    processResponse(response);
  } catch (e) {
    print('Error fetching data: $e');
  }
}



void processResponse(http.Response response) {
  var decodedData = jsonDecode(response.body);
  // process data
  print(decodedData);
}