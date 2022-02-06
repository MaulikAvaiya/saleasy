import 'package:flutter/material.dart';
import 'package:saleasy/list/company_list/company_visited_list.dart';

class CompanyVisitedScreen extends StatelessWidget {
  const CompanyVisitedScreen({Key? key}) : super(key: key);
  static const routeName='/company_visited_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('company visit'),
      ),
      body: CompanyVisitedList(),
      
    );
  }
}
