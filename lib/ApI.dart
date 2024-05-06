import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:listing_iteam/User_model.dart';

Future<List<User>> fetchData() async {
  final response = await http.get(Uri.parse('https://66307bafc92f351c03d9fa7b.mockapi.io/test'));

  if (response.statusCode == 200) {
    // Print response body to understand its structure
    print(response.body);

    // Parse JSON response
    List<dynamic> jsonData = jsonDecode(response.body);
    List<User> users = [];
    for (var item in jsonData) {
      users.add(User.fromJson(item));
    }
    return users;
  } else {
    // If the server did not return a 200 OK response,
    // throw an exception.
    throw Exception('Failed to load data');
  }
}
