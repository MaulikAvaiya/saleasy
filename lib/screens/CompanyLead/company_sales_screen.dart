import 'package:flutter/material.dart';
import 'package:saleasy/list/company_list/company_sales_list.dart';

class CompanySalesScreen extends StatelessWidget {
  const CompanySalesScreen({Key? key}) : super(key: key);
  static const routeName='/company_sales_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('company sales'),
      ),
      body:CompanySalesList(),
      
    );
  }
}
