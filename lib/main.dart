import 'package:flutter/material.dart';
import 'package:shoesapp/screens/cart.dart';
import 'package:shoesapp/screens/detailShoes.dart';
import 'package:shoesapp/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App Shoes',
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => HomeScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/detail': (context) => DetailShoes(),
        '/cart': (context) => CartScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFfefdfe),
        accentColor: Color(0xfffc4572),
        fontFamily: 'JostR',
      ),
    );
  }
}
