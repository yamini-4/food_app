import 'package:flutter/services.dart';

class ProductService {
  /// this method is to mock the poplar items
  /// reads the data from the json file in assets
  Future getProducts() async {
    String data = await rootBundle.loadString('assets/data/popular_items.json');
    return data;
  }
}
