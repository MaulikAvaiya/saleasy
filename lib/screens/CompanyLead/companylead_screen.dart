import 'package:flutter/material.dart';
import 'package:saleasy/AddForms/company_lead_forms/add_company_lead.dart';
import 'package:saleasy/constant/color_config.dart';
import 'package:saleasy/list/company_list/companylead_list.dart';

class CompanyLeadScreen extends StatelessWidget {
  const CompanyLeadScreen({Key? key}) : super(key: key);
  static const routeName='/company_lead_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('company lead'),
      ),
      body: CompanyLeadList(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddCompanyLead.routeName);
        },
        backgroundColor: ColorConfig.primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
