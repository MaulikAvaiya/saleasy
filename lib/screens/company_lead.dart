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
        backgroundColor: ColorConfig.appbarColor,
        title: Text(
          'Company Lead',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: ColorConfig.appbartextColor,
          ),
        ),
      ),
      body: Container(
        color: ColorConfig.primaryColor,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
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
                    width: 110,
                    height: 110,
                    child: Card(
                      child: Image.asset("assets/images/lead.png"),
                    ),
                  ),
                ),
                const Text(
                  "Lead",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(CompanyVisitedScreen.routeName);
                  },
                  child: SizedBox(
                    width: 110,
                    height: 110,
                    child: Card(
                      child: Image.asset("assets/images/visited-lead.png"),
                    ),
                  ),
                ),
                const Text(
                  "Visited Lead",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(CompanySalesScreen.routeName);
                  },
                  child: SizedBox(
                    width: 110,
                    height: 110,
                    child: Card(
                      child: Image.asset("assets/images/sales-lead.png"),
                    ),
                  ),
                ),
                const Text(
                  "Sales Lead",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
