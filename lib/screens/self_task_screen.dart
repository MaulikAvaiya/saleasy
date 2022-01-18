import 'package:flutter/material.dart';

class SelfTaskScreen extends StatelessWidget {
  static const routeName='/SelfTask-screen';
  const SelfTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SelfTask'),
      ),
      body: Center(
        child: Text('this is SelfTask screen'),
      ),
    );
  }
}
