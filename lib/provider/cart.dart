import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CartModel {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartModel({this.id, this.title, this.price, this.quantity});
}

class CartItem with ChangeNotifier {
  Map<String, CartModel> _items = {};

  Map<String, CartModel> get items {
    return {..._items};
  }

  int get itemcount {
    return _items.length;
  }

  double get totalsum {
    var total = 0.0;

    _items.forEach((key, CartModel) {
      total += CartModel.price * CartModel.quantity;
    });
    return total;
  }

  void additems(String id, String title, double price) {
    const url = 'https://shop-app-2813.firebaseio.com/detail.json';
    http.post(
      url,
      body: json.encode(
        {'title': title, 'price': price},
      ),
    );
    if (_items.containsKey(id)) {
      _items.update(
        id,
        (value) => CartModel(
            id: value.id,
            title: value.title,
            price: value.price,
            quantity: value.quantity + 1),
      );
    } else {
      _items.putIfAbsent(
        id,
        () => CartModel(
            id: DateTime.now().toString(),
            title: title,
            price: price,
            quantity: 1),
      );
    }
    notifyListeners();
  }
}
