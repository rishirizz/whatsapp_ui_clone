import 'dart:convert';

import 'package:http/http.dart' as http;

Future getNames() async {
  Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users/');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Unable to load data');
  }
}

Future getPhotos() async {
  Uri url = Uri.parse('https://jsonplaceholder.typicode.com/photos/');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Unable to load data');
  }
}
