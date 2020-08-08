import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart.dart';
import 'package:shop_app/widgets/cartproduct.dart';

class CartInfo extends StatelessWidget {
  static const routeName = '/mycart';

  @override
  Widget build(BuildContext context) {
    var Cartiinfo = Provider.of<CartItem>(context);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: height * 0.1,
            child: Card(
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Total',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Chip(
                    label: Text(Cartiinfo.totalsum.toString()),
                  ),
                  FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Order Now',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
            width: 150,
            child: Divider(color: Colors.black),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: Cartiinfo.itemcount,
              itemBuilder: (context, index) => CartProduct(
                ctitle: Cartiinfo.items.values.toList()[index].title,
                cquantity: Cartiinfo.items.values.toList()[index].quantity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
