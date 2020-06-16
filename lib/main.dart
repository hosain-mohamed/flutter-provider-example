import 'package:flutter/material.dart';
import 'package:state_mangment/models/cart_model.dart';
import 'screens/my_catalog.dart';
import 'screens/my_cart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // here we put ChangeNotifierProvider to provide our changenotifier to widgets or screens that 
    // can use it 
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return CartModel();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/':(context)=>MyCatalog(),
          '/cart':(context)=>MyCart()
        },
        title: 'Flutter Demo',
      ),
    );
  }
}
