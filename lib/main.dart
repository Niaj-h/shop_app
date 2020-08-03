import 'package:flutter/material.dart';
import 'package:shop_app/provider/products.dart';
import 'package:shop_app/screens/product_detail.dart';
import './screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Products(),
      child: MaterialApp(
        title: 'shopping app',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        routes: {'/productdetails': (context) => ProductDetail()},
      ),
    );
  }
}
