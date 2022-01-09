import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  static const routeName='/Product-screen';
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
      ),
      body: Center(
        child: Text('this is Product screen'),
      ),
    );
  }
}
