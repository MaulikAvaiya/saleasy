import 'package:flutter/material.dart';

class TargetScreen extends StatelessWidget {
  static const routeName='/Target-screen';
  const TargetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Target'),
      ),
      body: Center(
        child: Text('this is Target screen'),
      ),
    );
  }
}
