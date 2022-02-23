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
        backgroundColor: ColorConfig.primaryColor,
        title: const Text(
          'Employee Detail',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: EmployeeList(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         Navigator.of(context).pushNamed(AddEmployee.routeName);
        },
        backgroundColor: ColorConfig.primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
