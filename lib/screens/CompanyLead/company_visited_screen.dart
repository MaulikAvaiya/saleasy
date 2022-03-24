import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';
import 'package:saleasy/list/company_list/company_visited_list.dart';

class CompanyVisitedScreen extends StatelessWidget {
  const CompanyVisitedScreen({Key? key}) : super(key: key);
  static const routeName = '/company_visited_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.appbarColor,
        title: Text(
          'Company Visit List',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: ColorConfig.appbartextColor,
          ),
        ),
      ),
      body: const CompanyVisitedList(),
    );
  }
}
