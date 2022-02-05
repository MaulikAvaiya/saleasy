import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';

class SalesLeadScreen extends StatelessWidget {
  static const routeName = '/Sales-lead-screen';
  const SalesLeadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.primaryColor,
      appBar: AppBar(
        title: const Text(
          'Sales Lead Details',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: Center(
        child: Text('this is Visitad lead screen'),
      ),
    );
  }
}
