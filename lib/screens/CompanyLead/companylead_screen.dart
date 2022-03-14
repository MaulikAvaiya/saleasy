import 'package:flutter/material.dart';
import 'package:saleasy/AddForms/company_lead_forms/add_company_lead.dart';
import 'package:saleasy/constant/color_config.dart';
import 'package:saleasy/list/company_list/companylead_list.dart';

class CompanyLeadScreen extends StatelessWidget {
  const CompanyLeadScreen({Key? key}) : super(key: key);
  static const routeName = '/company_lead_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.appbarColor,
        title: Text(
          'Company Lead List',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: ColorConfig.appbartextColor,
          ),
        ),
      ),
      body: CompanyLeadList(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddCompanyLead.routeName);
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
