import 'package:flutter/material.dart';

class SelfLeadScreen extends StatelessWidget {
  static const routeName='/SelfLead-screen';
  const SelfLeadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SelfLead'),
      ),
      body: Center(
        child: Text('this is SelfLead screen'),
      ),
    );
  }
}
