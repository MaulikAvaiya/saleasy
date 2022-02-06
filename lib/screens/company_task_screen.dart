import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';
import 'package:saleasy/list/companytask_list.dart';

class CompanyTaskScreen extends StatelessWidget {
  static const routeName='/CompanyTask-screen';
  const CompanyTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CompanyTaskScreen'),
      ),
      body: CompanyTaskList(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        //  Navigator.of(context).pushNamed(AddEmployee.routeName);
        },
        backgroundColor: ColorConfig.primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
