```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the data
      final jsonData = jsonDecode(response.body);
      // Access data assuming it's a list
      for (var item in jsonData) {
        print(item['name']); // potential error here if 'name' key is missing
      }
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching data: $e');
    // Missing proper error handling - consider re-throwing or logging with more details
  }
}
```