import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:imake/models/auth_model.dart';
import 'dart:convert' as convert;

Future<List<Product>> fetchFromServer() async {
  var url = Uri.parse('https://192.168.1.193');
  //var response = await http.get(url);
  var response =
      await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  print(await http.read(url));

  List<Product> productList = [];
  if (response.statusCode == 200) {
    var productMap = convert.jsonDecode(response.body);
    for (final item in productMap) {
      productList.add(Product.fromJson(item));
    }
  }
  return productList;
}

void main(List<String> arguments) async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  var url =
      Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    var itemCount = jsonResponse['totalItems'];
    print('Number of books about http: $itemCount.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
