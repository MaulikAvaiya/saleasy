import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';

class LeadScreen extends StatelessWidget {
  static const routeName = '/lead-screen';
  const LeadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.primaryColor,
      appBar: AppBar(
        title: const Text(
          'Self Lead List',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: Center(
        child: Text('this is lead screen'),
      ),
    );
  }
}
