import 'package:flutter/material.dart';
import 'package:saleasy/AddForms/self_lead_forms/add_sales_lead.dart';
import 'package:saleasy/constant/color_config.dart';
import 'package:saleasy/list/self_list/self_sales_list.dart';

class SelfSalesScreen extends StatelessWidget {
  static const routeName = '/self-sales-screen';
  const SelfSalesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.appbarColor,
        title: Text(
          'Sales Lead List',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: ColorConfig.appbartextColor,
          ),
        ),
      ),
      body: SelfSalesList(),
    );
  }
}
