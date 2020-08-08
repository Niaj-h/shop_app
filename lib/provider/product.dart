import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String imageurl;
  final double price;
  bool isfavorite;

  Product(
      {@required this.id,
      @required this.title,
      @required this.imageurl,
      this.isfavorite = false,
      @required this.price});

  void TogglefavStatus() {
    isfavorite = !isfavorite;
    notifyListeners();
  }
}
