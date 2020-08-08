import 'package:flutter/material.dart';

class CartProduct extends StatelessWidget {
  final cid;
  final ctitle;
  final cimage;
  final cquantity;

  CartProduct({this.cid, this.ctitle, this.cquantity, this.cimage});
  @override
  Widget build(BuildContext context) {
    var cardheight = MediaQuery.of(context).size.height;
    var widdth = MediaQuery.of(context).size.width;
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: ValueKey(23),
      background: Container(
        color: Colors.red,
        child: Icon(Icons.delete),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 12),
      ),
      child: Container(
        height: cardheight * 0.11,
        child: Card(
          color: Colors.black,
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
              ),
              SizedBox(width: widdth * 0.3),
              Text(ctitle, style: TextStyle(color: Colors.white)),
              SizedBox(width: widdth * 0.1),
              Text(cquantity.toString(), style: TextStyle(color: Colors.white))
            ],
          ),
        ),
      ),
    );
  }
}
