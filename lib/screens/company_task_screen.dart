import 'package:flutter/material.dart';

class CompanyTaskScreen extends StatelessWidget {
  static const routeName='/CompanyTask-screen';
  const CompanyTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CompanyTaskScreen'),
      ),
      body: Center(
        child: Text('this is CompanyTask screen'),
      ),
    );
  }
}
