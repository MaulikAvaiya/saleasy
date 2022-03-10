import 'package:flutter/material.dart';
import 'package:saleasy/AddForms/self_lead_forms/add_self_lead.dart';
import 'package:saleasy/constant/color_config.dart';
import 'package:saleasy/list/self_list/selflead_list.dart';

class SelfLeadScreen extends StatelessWidget {
  static const routeName = '/selflead_screen';
  const SelfLeadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.appbarColor,
        title: Text(
          'Self Lead List',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: ColorConfig.appbartextColor,
          ),
        ),
      ),
      body: SelfLeadList(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddSelfLead.routeName);
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
