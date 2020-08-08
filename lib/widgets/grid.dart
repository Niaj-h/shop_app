import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart.dart';
import 'package:shop_app/provider/product.dart';

class Grid extends StatelessWidget {
  // final String gid;
  // final String url;
  // final String gtitle;

  // Grid(this.url, this.gtitle, this.gid);
  @override
  Widget build(BuildContext context) {
    final produxtsdata = Provider.of<Product>(context);
    final cartdata = Provider.of<CartItem>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed('/productdetails', arguments: produxtsdata.id);
        },
        child: GridTile(
          child: Image.network(produxtsdata.imageurl, fit: BoxFit.cover),
          footer: GridTileBar(
            backgroundColor: Colors.black45,
            title: Center(child: Text(produxtsdata.title)),
            leading: IconButton(
              icon: Icon(produxtsdata.isfavorite
                  ? Icons.favorite
                  : Icons.favorite_border),
              onPressed: () {
                produxtsdata.TogglefavStatus();
              },
            ),
            trailing: IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {
                  cartdata.additems(
                      produxtsdata.id, produxtsdata.title, produxtsdata.price);
                }),
          ),
        ),
      ),
    );
  }
}
