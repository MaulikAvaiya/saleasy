import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';
import 'Lead_screen.dart';
import 'visited_lead_screen.dart';
import 'sales_lead_screen.dart';

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
          child: SizedBox(
            width: 420,
            height: 670,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.white,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.only(top: 18),
                child: GridView.custom(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    (BuildContext, index) {
                      return GestureDetector(
                        onTap: () {
                          switch (index) {
                            case 0:
                              Navigator.pushNamed(
                                  context, LeadScreen.routeName);
                              break;
                            case 1:
                              Navigator.pushNamed(
                                  context, VisitedLeadScreen.routeName);
                              break;
                            case 2:
                              Navigator.pushNamed(
                                  context, SalesLeadScreen.routeName);
                              break;
                          }
                          child:
                          Column(
                            children: [
                              Container(
                                child: Card(
                                  color: ColorConfig.primaryColor,
                                  elevation: 5,
                                  child: Image.asset(
                                    images[index],
                                    fit: BoxFit.cover,
                                    height: 91,
                                    width: 91,
                                  ),
                                ),
                              ),
                              Text(
                                title[index],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    childCount: 3,
                  ),
                  padding: EdgeInsets.all(10),
                  shrinkWrap: true,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
