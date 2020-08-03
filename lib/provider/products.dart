import 'product.dart';
import 'package:flutter/material.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: 'a1',
        title: 'Macbook Pro 2019',
        imageurl:
            'https://images-na.ssl-images-amazon.com/images/I/71h6PpGaz9L._AC_SL1500_.jpg'),
    Product(
        id: 'a2',
        title: 'Iphone',
        imageurl:
            'https://cdn.vox-cdn.com/thumbor/MwokWf8IUu77WSTyqnrzfHfrWew=/0x146:2040x1214/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/19206380/akrales_190913_3666_0391.jpg'),
    Product(
        id: 'a3',
        title: 'Dslr',
        imageurl:
            'https://shatnews.com/wp-content/uploads/2018/08/abba789c15e43784ddd0c235569c3987.jpg'),
    Product(
        id: 'a4',
        title: 'Graphics Tablet',
        imageurl:
            'https://imgaz.staticbg.com/thumb/large/oaupload/banggood/images/34/F8/365516b2-22f0-44ed-9c86-af8bf77e0cab.jpg')
  ];

  List<Product> get item {
    return [..._items];
  }

  List<Product> get favoruteitems {
    return _items.where((proaad) => proaad.isfavorite).toList();
  }

  void addproduct() {
    notifyListeners();
  }
}
