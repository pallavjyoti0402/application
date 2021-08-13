import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../models/categories.dart';

class ProviderCategory with ChangeNotifier {
  List<Category> _categories = [];

  List<Category> get catregories {
    return [..._categories];
  }

  Future<String> getCategory() async {
    var url = Uri.http('13.232.64.117', '/category/', {'q': '{http}'});
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print('Request passed with status: ${response.statusCode}.');
      List<dynamic> body = convert.jsonDecode(response.body);
      print('$body');
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print('$jsonResponse');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    //_categories = notifyListeners();
    return "Hello";
  }
}
