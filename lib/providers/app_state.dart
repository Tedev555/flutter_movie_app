import 'package:flutter/material.dart';
import 'package:flutter_movies_app/models/user.dart';

class AppState extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  set user(User? user) {
    _user = user;
    notifyListeners();
  }
}
