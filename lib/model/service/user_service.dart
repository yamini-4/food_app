import 'package:flutter/services.dart';

class UserService {
  Future getUserdata() async {
    String data = await rootBundle.loadString('assets/data/user_data.json');
    return data;
  }
}
