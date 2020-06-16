import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_mangment/models/cart_model.dart';

class MyCatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Catalog")),
      body: CatalogBody(),
    );
  }
}

class CatalogBody extends StatelessWidget {
  const CatalogBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // listView contain all items [item A , item B , ...]
        // each item contain a button opposite it either for add if it's not present in the cart list
        // or remove it when it present in  
        MyListView(),
        SizedBox(height: 100),
        // Button below the list to go to MyCart screen and beside the button the number of items selected 
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
                onPressed: () => Navigator.pushNamed(context, '/cart'),
                child: Text(
                  "My Cart",
                  style: TextStyle(fontSize: 20),
                )),
            SizedBox(width: 5),
            Consumer<CartModel>(
              builder: (BuildContext context, CartModel cartModel, Widget child) {
                return Text(
                  "(${cartModel.items.length})",
                  style: TextStyle(fontSize: 15),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}

final List<String> products = <String>[
  "item A",
  "item B",
  "item C",
  "item D",
  "item E",
  "item F",
  "item G",
  "item H"
];

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  products[index],
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
                SizedBox(width: 50),
                Add(products[index])
              ],
            ),
          ),
        );
      },
    );
  }
}

class Add extends StatelessWidget {
  final String item;
  const Add(
    this.item, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(builder: (BuildContext context, CartModel cartModel, Widget child) { 
      return FlatButton(
        splashColor: Colors.yellow[300],
        onPressed: cartModel.items.contains(item)
            ? () => cartModel.removeItem(item)
            : () => cartModel.addItem(item),
        child: cartModel.items.contains(item) ? Text("Remove") : Text("Add"));
     },);
            }
}
