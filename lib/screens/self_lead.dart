import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';
import 'package:saleasy/screens/selflead/self_sales_screen.dart';
import 'package:saleasy/screens/selflead/self_visited_screen.dart';
import 'package:saleasy/screens/selflead/selflead_screen.dart';

class SelfLead extends StatelessWidget {
  static const routeName = '/Self-Lead';
  SelfLead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.appbarColor,
        title: Text(
          'Self Lead Dashboard',
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
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(SelfLeadScreen.routeName);
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
                        .pushNamed(SelfVisitedScreen.routeName);
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
                    Navigator.of(context).pushNamed(SelfSalesScreen.routeName);
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
