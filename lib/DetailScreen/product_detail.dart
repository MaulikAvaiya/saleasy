import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';

class ProductDetail extends StatefulWidget {
  final String name;
  final String rate;

   ProductDetail({Key? key,required this.name,required this.rate}) : super(key: key);
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
            Text(widget.name),
            Text("Rate:"),
            Text(widget.rate),
          ],
        ),
      ),
    );
  }
}
