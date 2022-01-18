import 'package:flutter/material.dart';

class EmployeeScreen extends StatelessWidget {
  static const routeName='/employee-screen';
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee'),
      ),
      body: Center(
        child: Text('this is Employee screen'),
      ),
    );
  }
}
