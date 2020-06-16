import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_mangment/models/cart_model.dart';

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My cart")),
      body: CartBody(),
    );
  }
}

class CartBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CartListView(),
        ClearCartButton(),
      ],
    );
  }
}


class CartListView extends StatelessWidget {
  const CartListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (BuildContext context, CartModel cartModel, Widget child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: cartModel.items.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "${cartModel.items[index]}",
                    style: TextStyle(fontSize: 25),
                  ),
                  FlatButton(
                      onPressed: () =>
                          cartModel.removeItem(cartModel.items[index]),
                      child: Text(
                        "Remove",
                      )),
                ],
              ),
            );
          },
        );
      },
    );
  }
}


class ClearCartButton extends StatelessWidget {
  const ClearCartButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartModel = Provider.of<CartModel>(context,listen: false);
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        FlatButton(
            onPressed: () => cartModel.items.length > 0
                ? cartModel.removeAll()
                : () => null,
            child: Text("Clear All")),
      ],
    );
  }
}
