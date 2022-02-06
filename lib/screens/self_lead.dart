import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';
import 'package:saleasy/screens/selflead/self_sales_screen.dart';
import 'package:saleasy/screens/selflead/self_visited_screen.dart';
import 'package:saleasy/screens/selflead/selflead_screen.dart';

class SelfLead extends StatelessWidget {
  static const routeName = '/SelfLead';
   SelfLead({Key? key}) : super(key: key);

  List<String> images = [
    "assets/images/product-return.png",
    "assets/images/product-return.png",
    "assets/images/product-return.png",
  ];

  List<String> title = [
    'Lead',
    'Visited Lead',
    'Sales Lead',
  ];
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
            padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            child: SizedBox(
              width: double.infinity,

              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  elevation: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap:() {
                          Navigator.of(context).pushNamed(SelfLeadScreen.routeName);
                        } ,
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
                        onTap:() {
                          Navigator.of(context).pushNamed(SelfVisitedScreen.routeName);
                        } ,
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
                        onTap:() {
                          Navigator.of(context).pushNamed(SelfSalesScreen.routeName);
                        } ,
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
