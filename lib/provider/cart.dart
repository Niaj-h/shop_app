import 'package:flutter/material.dart';

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

  void additems(String id, String title, double price) {
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
  }
}
