import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';
import 'package:saleasy/list/target_list.dart';

import '../AddForms/target_form.dart';

class TargetScreen extends StatelessWidget {
  static const routeName = '/Target-screen';
  const TargetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.appbarColor,
        title: Text(
          'Target List',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: ColorConfig.appbartextColor,
          ),
        ),
      ),
      body: const TargetList(),
      backgroundColor: ColorConfig.primaryColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.of(context).pushNamed(AddTarget.routeName);
        },
        backgroundColor: ColorConfig.appbarColor,
        child: Icon(
          Icons.add,
          color: ColorConfig.appbartextColor,
        ),
      ),
    );
  }
}
