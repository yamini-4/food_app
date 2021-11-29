import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/model/data_model/product_response.dart';
import 'package:food_app/model/service/product_service.dart';

class ProductState extends ChangeNotifier {
  Map<String, dynamic> _data = {};

  final ProductService _service =
      ProductService(); // instance of product service

  Promotion? _promotion;

  List<Popular>? _popularItems;

  bool _loading = true;

  // to get the instance of for _promotion object
  Promotion? get promotion => _promotion!;

  // to get the instance of for _popular list
  List<Popular>? get popularItems => _popularItems!;

  bool get loading => _loading;

  void getProducts() async {
    // to show mock loader
    // await Future.delayed(const Duration(seconds: 3));
    // gets the data from the json in assets folder
    String str = await _service.getProducts();

    // converts the string to map
    _data = jsonDecode(str);

    // converts the map to ProductResponse class
    ProductResponse response = ProductResponse.fromJson(_data);

    // sets the value to _promotion private variable
    _promotion = response.promotion;

    // sets the value to _popularItems private variable
    _popularItems = response.popular;

    _loading = false;

    // notifies the UI / consumer
    notifyListeners();
  }
}
