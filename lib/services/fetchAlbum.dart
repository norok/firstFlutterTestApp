import 'dart:convert';
import 'dart:async';

import 'package:fluttertest/classes/Album.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum(int id) async {
  final response =
      await http.get("https://jsonplaceholder.typicode.com/albums/$id");

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Album');
  }
}

Future<List<Album>> fetchAlbums() async {
  final response =
      await http.get("https://jsonplaceholder.typicode.com/albums/");

  List<Album> albums = [];

  if (response.statusCode == 200) {
    List responses = jsonDecode(response.body);

    for (var album in responses) {
      albums.add(Album.fromJson(album));
    }

    return albums;
  } else {
    throw Exception('Failed to load Album list');
  }
}
