import 'dart:convert';
import 'dart:async';

import 'package:fluttertest/classes/User.dart';
import 'package:http/http.dart' as http;

Future<User> fetchUser(int id) async {
  final response =
      await http.get("https://jsonplaceholder.typicode.com/users/$id");

  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Album');
  }
}
