```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData is List) {
        for (var item in jsonData) {
          final name = item['name'] ?? 'N/A'; // Handle missing 'name' key
          print('Name: $name');
        }
      } else {
        print('Unexpected JSON format: $jsonData'); //Handle non-list responses
      }
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}, Body: ${response.body}');
    }
  } on FormatException catch (e) {
    print('Invalid JSON format: $e');
  } catch (e) {
    print('Error fetching data: $e');
    //Optionally re-throw the exception to be handled higher up in the call stack
    //rethrow;
  }
}
```