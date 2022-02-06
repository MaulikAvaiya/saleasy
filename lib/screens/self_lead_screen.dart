import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';
import 'package:saleasy/screens/selflead/lead_screen.dart';
import 'package:saleasy/screens/selflead/sales_lead_screen.dart';
import 'package:saleasy/screens/selflead/visited_lead_screen.dart';

class SelfLeadScreen extends StatelessWidget {
  static const routeName = '/self-lead-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.primaryColor,
        title: const Text(
          'Self Lead Dashboard',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: Container(
        color: ColorConfig.backColor,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                        Navigator.of(context).pushNamed(LeadScreen.routeName);
                      },
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Card(
                          color: Colors.amber,
                          child: Image.asset(""),
                        ),
                      ),
                    ),
                    Text("Lead"),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(VisitedLeadScreen.routeName);
                      },
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Card(
                          color: Colors.amber,
                          child: Image.asset(""),
                        ),
                      ),
                    ),
                    Text("Visited Lead"),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(SalesLeadScreen.routeName);
                      },
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Card(
                          color: Colors.amber,
                          child: Image.asset(""),
                        ),
                      ),
                    ),
                    Text("Sales Lead"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
