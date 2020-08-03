import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/products.dart';
import '../widgets/grid.dart';

class ProductGrid extends StatelessWidget {
  final bool showfavs;
  ProductGrid(this.showfavs);
  @override
  Widget build(BuildContext context) {
    final productdetail = Provider.of<Products>(context);
    final prodduct =
        showfavs ? productdetail.favoruteitems : productdetail.item;
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 3 / 2),
      itemCount: prodduct.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: prodduct[index],
        child: Grid(
            // prodduct[index].imageurl,
            // prodduct[index].title,
            // prodduct[index].id,
            ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _showonlyfavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: Colors.black,
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (int selectedvalue) {
              setState(() {
                if (selectedvalue == 0) {
                  _showonlyfavorite = true;
                } else {
                  _showonlyfavorite = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('favorite'),
                value: 0,
              ),
              PopupMenuItem(
                child: Text('All Products'),
                value: 1,
              )
            ],
          )
        ],
      ),
      body: ProductGrid(_showonlyfavorite),
    );
  }
}
