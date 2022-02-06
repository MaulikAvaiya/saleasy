import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);
  static const routeName = '/Product_detail';
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConfig.primaryColor,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Text("Product Name:"),
            Text("pencil"),
            Text("Rate:"),
            Text("10"),
          ],
        ),
      ),
    );
  }
}
