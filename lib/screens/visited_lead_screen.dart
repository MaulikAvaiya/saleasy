import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';

class VisitedLeadScreen extends StatelessWidget {
  static const routeName = '/visited-lead-screen';
  const VisitedLeadScreen({Key? key}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.primaryColor,
      appBar: AppBar(
        title: const Text(
          'Visited Lead Details',
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
