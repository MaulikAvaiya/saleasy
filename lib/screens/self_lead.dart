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
      body: SingleChildScrollView(
        child: Container(
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
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 7),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 90,
                            child: Image.asset(
                              "assets/images/lead.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 150,
                            color: const Color(0xff005757).withOpacity(0.08),
                            child: const Text(
                              "Lead",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(SelfVisitedScreen.routeName);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 7),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 90,
                            child: Image.asset(
                              "assets/images/visited-lead.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 150,
                            color: const Color(0xff005757).withOpacity(0.08),
                            child: const Text(
                              "Visited Lead",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(SelfSalesScreen.routeName);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 7),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 90,
                            child: Image.asset(
                              "assets/images/sales-lead.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 150,
                            color: const Color(0xff005757).withOpacity(0.08),
                            child: const Text(
                              "Sales Lead",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
