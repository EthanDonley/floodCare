import 'package:http/http.dart' as http;
import 'dart:convert';

class FemaApiService {
  final String baseUrl = 'https://www.fema.gov/api/open/v2/DisasterDeclarationsSummaries';

  Future<List<dynamic>> fetchData() async {
    try {
      var queryParams = {
        '\$top': '1000',
        '\$count': 'true'
      };

      var uri = Uri.parse(baseUrl).replace(queryParameters: queryParams);
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        print("Data fetched successfully!");
        var data = jsonDecode(response.body);
        print(jsonEncode(data)); // To print the data in a formatted way
        // Check for the 'DisasterDeclarationsSummaries' key in the JSON response
        if (data is Map && data.containsKey('DisasterDeclarationsSummaries')) {
          return data['DisasterDeclarationsSummaries'];
        } else {
          print("Expected key 'DisasterDeclarationsSummaries' not found in JSON response");
          return [];
        }
      } else {
        print('Failed to fetch data. HTTP Status: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to load data from API');
      }
    } catch (e) {
      print('Exception caught: $e');
      throw Exception('Failed due to an exception: $e');
    }
  }
}
