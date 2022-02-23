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
      backgroundColor: ColorConfig.primaryColor,
      appBar: AppBar(
        title: const Text(
          'sales Lead list',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: SelfSalesList(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AddSalesLead.routeName);
          },
          backgroundColor: ColorConfig.primaryColor,
          child: const Icon(Icons.add),
        ),
    );
  }
}
