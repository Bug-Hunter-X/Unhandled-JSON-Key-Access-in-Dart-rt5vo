```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      //Safely access the key
      final nonExistentValue = jsonData['nonExistentKey'];
      final value = nonExistentValue ?? 'Default Value'; //Use null-aware operator
      print(value);
      //Alternative approach using containsKey()
      if(jsonData.containsKey('someKey')){
        print(jsonData['someKey']);
      }

    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```