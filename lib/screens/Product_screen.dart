import 'package:flutter/material.dart';
import 'package:saleasy/AddForms/add_product.dart';
import 'package:saleasy/constant/color_config.dart';
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
        backgroundColor: ColorConfig.appbarColor,
        title: Text(
          'Product List',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: ColorConfig.appbartextColor
          ),
        ),
      ),
      body: const ProductList(),
      backgroundColor: ColorConfig.primaryColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddProduct.routeName);
        },
        backgroundColor: ColorConfig.appbarColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
