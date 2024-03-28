import 'package:flutter/material.dart';
import 'package:trail/screen/cart_data.dart';
import 'package:trail/screen/detail_page.dart';
import 'package:trail/screen/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const HomePage(),
      'DetailPage': (context) => const DetailPage(),
      'Cart_page': (context) => const CartPage(),
    },
  ));
}
