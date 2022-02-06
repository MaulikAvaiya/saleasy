import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';
import 'package:saleasy/screens/CompanyLead/company_sales_screen.dart';
import 'package:saleasy/screens/CompanyLead/company_visited_screen.dart';
import 'package:saleasy/screens/CompanyLead/companylead_screen.dart';

class CompanyLead extends StatelessWidget {
  static const routeName = '/CompanyLead-screen';
  const CompanyLead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CompanyLead'),
      ),
      body: Container(
        color: ColorConfig.backColor,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: SizedBox(
              width: double.infinity,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(CompanyLeadScreen.routeName);
                        },
                        child: SizedBox(
                          width: 150,
                          height: 150,
                          child: Card(
                            color: ColorConfig.primaryColor,
                            child: Image.asset(""),
                          ),
                        ),
                      ),
                      Text("Lead"),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(CompanyVisitedScreen.routeName);
                        },
                        child: SizedBox(
                          width: 150,
                          height: 150,
                          child: Card(
                            color: ColorConfig.primaryColor,
                            child: Image.asset(""),
                          ),
                        ),
                      ),
                      Text("Visited Lead"),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(CompanySalesScreen.routeName);
                        },
                        child: SizedBox(
                          width: 150,
                          height: 150,
                          child: Card(
                            color: ColorConfig.primaryColor,
                            child: Image.asset(""),
                          ),
                        ),
                      ),
                      Text("Sales Lead")
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
