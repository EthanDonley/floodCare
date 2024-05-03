import 'package:http/http.dart' as http;
import 'dart:convert';

class FemaApiService {
  final String baseUrl = 'https://www.fema.gov/api/open/v2/DisasterDeclarationsSummaries';

  Future<void> fetchData() async {
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
      } else {
        print('Failed to fetch data. HTTP Status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Exception caught: $e');
    }
  }
}
