import 'package:flutter/material.dart';

class CompanyLeadScreen extends StatelessWidget {
  static const routeName='/CompanyLead-screen';
  const CompanyLeadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CompanyLead'),
      ),
      body: Center(
        child: Text('this is CompanyLead screen'),
      ),
    );
  }
}
