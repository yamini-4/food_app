import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/model/data_model/user.dart';
import 'package:food_app/model/service/user_service.dart';

class UserState extends ChangeNotifier {
  Map<String, dynamic> _data = {};
  final UserService _service = UserService();
  User? _user;
  User? get user => _user;
  bool _loading = true;
  bool get loading => _loading;

  Future<void> getUserdata() async {
    String str = await _service.getUserdata();
    _data = jsonDecode(str);
    User response = User.fromJson(_data);
    _user = response;
    _loading = false;
    notifyListeners();
  }
}
