import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';
import 'Lead_screen.dart';
import 'selflead/visited_lead_screen.dart';
import 'selflead/sales_lead_screen.dart';

class SelfLeadScreen extends StatefulWidget {
  static const routeName = '/SelfLead-screen';
  const SelfLeadScreen({Key? key}) : super(key: key);

  @override
  State<SelfLeadScreen> createState() => _SelfLeadScreenState();
}

class _SelfLeadScreenState extends State<SelfLeadScreen> {
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
                      //  onTap: ,
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
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: Card(
                          color: Colors.amber,
                          child: Image.asset(""),
                        ),
                      ),
                      Text("Visited Lead"),
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: Card(
                          color: Colors.amber,
                          child: Image.asset(""),
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
