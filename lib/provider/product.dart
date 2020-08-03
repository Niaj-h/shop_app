import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String imageurl;
  bool isfavorite;

  Product(
      {@required this.id,
      @required this.title,
      @required this.imageurl,
      this.isfavorite = false});

  void TogglefavStatus() {
    isfavorite = !isfavorite;
    notifyListeners();
  }
}
