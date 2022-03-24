import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';
import 'package:saleasy/list/selftask_list.dart';

class SelfTaskScreen extends StatelessWidget {
  static const routeName = '/SelfTask-screen';
  const SelfTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.appbarColor,
        title: Text(
          'Self Task',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: ColorConfig.appbartextColor,
          ),
        ),
      ),
      body: const SelfTaskList(),
      backgroundColor: ColorConfig.primaryColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //  Navigator.of(context).pushNamed(AddEmployee.routeName);
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
