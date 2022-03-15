import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';
import '../auth/profile_screen.dart';
import 'Product_screen.dart';
import 'company_lead.dart';
import 'company_task_screen.dart';
import 'employee_screen.dart';
import 'self_lead.dart';
import 'self_task_screen.dart';
import 'target_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = [
    "assets/images/product.png",
    "assets/images/employee.png",
    "assets/images/self-lead.png",
    "assets/images/company-lead.png",
    "assets/images/self-task.png",
    "assets/images/company-task.png",
    "assets/images/target.png",
    "assets/images/profile.png",
  ];

  List<String> title = [
    'Product',
    'Employee',
    'Self Lead',
    'Company Lead',
    'Self Task',
    'Company Task',
    'Target',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    debugPrint(screenHeight.toString());
    debugPrint(screenWidth.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.appbarColor,
        title: Text(
          'SalEasy',
          style: TextStyle(
            fontSize: screenHeight * 0.044,
            fontWeight: FontWeight.bold,
            color: ColorConfig.appbartextColor,
          ),
        ),
      ),
      body: Container(
        color: ColorConfig.primaryColor,
        child: Center(
          child: GridView.custom(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.2,
              crossAxisSpacing: screenWidth * 0.001,
              mainAxisSpacing: screenHeight * 0.001,
            ),
            childrenDelegate: SliverChildBuilderDelegate(
              (BuildContext, index) {
                return GestureDetector(
                  onTap: () {
                    switch (index) {
                      case 0:
                        Navigator.pushNamed(context, ProductScreen.routeName);
                        break;
                      case 1:
                        Navigator.pushNamed(context, EmployeeScreen.routeName);
                        break;
                      case 2:
                        Navigator.pushNamed(context, SelfLead.routeName);
                        break;
                      case 3:
                        Navigator.pushNamed(context, CompanyLead.routeName);
                        break;
                      case 4:
                        Navigator.pushNamed(context, SelfTaskScreen.routeName);
                        break;
                      case 5:
                        Navigator.pushNamed(
                            context, CompanyTaskScreen.routeName);
                        break;
                      case 6:
                        Navigator.pushNamed(context, TargetScreen.routeName);
                        break;
                      case 7:
                        Navigator.pushNamed(context, ProfileScreen.routeName);
                        break;
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.03),
                    child: Column(
                      children: [
                        // Card(
                        //   color: ColorConfig.primaryColor,
                        //   elevation: 5,
                        //   child: Image.asset(
                        //     images[index],
                        //     width: screenWidth * 0.22,
                        //   ),
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.only(top: screenHeight * 0.002),
                        //   child: Text(
                        //     title[index],
                        //     style: TextStyle(
                        //       fontSize: screenHeight * 0.02,
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //   ),
                        // ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 3,
                                  blurRadius: 7),
                            ],
                          ),
                          child: Column(children: [
                            SizedBox(
                              width: 90,
                              child: Image.asset(
                                images[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 150,
                              color: const Color(0xff005757).withOpacity(0.08),
                              child: Text(
                                title[index],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ]),
                        )
                      ],
                    ),
                  ),
                );
              },
              childCount: 8,
            ),
            shrinkWrap: true,
          ),
        ),
      ),
    );
  }
}
