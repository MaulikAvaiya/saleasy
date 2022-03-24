import 'package:flutter/material.dart';
import 'package:saleasy/list/company_list/company_sales_list.dart';

import '../../constant/color_config.dart';

class CompanySalesScreen extends StatelessWidget {
  const CompanySalesScreen({Key? key}) : super(key: key);
  static const routeName = '/company_sales_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.appbarColor,
        title: Text(
          'Company Sales List',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: ColorConfig.appbartextColor,
          ),
        ),
      ),
      body: const CompanySalesList(),
    );
  }
}
