import 'package:flutter/material.dart';
import 'package:saleasy/AddForms/add_employee.dart';
import 'package:saleasy/constant/color_config.dart';
import 'package:saleasy/list/employee_list.dart';

class EmployeeScreen extends StatelessWidget {
  static const routeName = '/employee-screen';
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.appbarColor,
        title: Text(
          'Employee Detail',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: ColorConfig.appbartextColor,
          ),
        ),
      ),
      body: EmployeeList(),
      backgroundColor: ColorConfig.primaryColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddEmployee.routeName);
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
