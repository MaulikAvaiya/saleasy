import 'package:flutter/material.dart';
import 'package:saleasy/AddForms/add_product.dart';
import 'package:saleasy/constant/color_config.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saleasy/list/product_list.dart';

class ProductScreen extends StatefulWidget {
  static const routeName = '/Product-screen';

  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.primaryColor,
        title: const Text(
          'Product List',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      
        body: ProductList(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AddProduct.routeName);
          },
          backgroundColor: ColorConfig.primaryColor,
          child: const Icon(Icons.add),
        ),
      );
  }
}
