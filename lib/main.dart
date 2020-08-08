import 'package:flutter/material.dart';
import 'package:shop_app/provider/cart.dart';
import 'package:shop_app/provider/products.dart';
import 'package:shop_app/screens/cartinfo.dart';
import 'package:shop_app/screens/product_detail.dart';
import './screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(create: (context) => CartItem())
      ],
      child: MaterialApp(
        title: 'shopping app',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        routes: {
          '/productdetails': (context) => ProductDetail(),
          CartInfo.routeName: (context) => CartInfo()
        },
      ),
    );
  }
}
