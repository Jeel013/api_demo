
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AppProvider extends ChangeNotifier {
  late List current = [];

loadUserList() async {

  String weatherapi =
      "https://pixabay.com/api/?key=36932518-7b086ea9d2a30297567dc52eb&q=yellow+flowers&image_type=photo";
  http.Response response = await http.get(Uri.parse(weatherapi));

  if (response.statusCode == 200) {
    var current = jsonDecode(response.body);

    var currentweatherdata = await current;
    print(response.body);
    print(current);
    return currentweatherdata;
  }
  notifyListeners();
}
}