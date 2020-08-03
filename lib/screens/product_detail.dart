import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/products.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productid = ModalRoute.of(context).settings.arguments;
    final loadedproducts = Provider.of<Products>(context)
        .item
        // ignore: unrelated_type_equality_checks
        .firstWhere((prod) => prod.id == productid);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedproducts.title),
        backgroundColor: Colors.black,
      ),
    );
  }
}
