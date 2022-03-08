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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConfig.primaryColor,
          title: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'SalEasy saleasy',
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
          ),
        ),
        body: Container(
          color: ColorConfig.backColor,
          child: Center(
            child: SizedBox(
              width: 400,
              height: 580,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color:Colors.white,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: GridView.custom(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
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
                                    context, ProductScreen.routeName);
                                break;
                              case 1:
                                Navigator.pushNamed(
                                    context, EmployeeScreen.routeName);
                                break;
                              case 2:
                                Navigator.pushNamed(
                                    context, SelfLead.routeName);
                                break;
                              case 3:
                                Navigator.pushNamed(
                                    context, CompanyLead.routeName);
                                break;
                              case 4:
                                Navigator.pushNamed(
                                    context, SelfTaskScreen.routeName);
                                break;
                              case 5:
                                Navigator.pushNamed(
                                    context, CompanyTaskScreen.routeName);
                                break;
                              case 6:
                                Navigator.pushNamed(
                                    context, TargetScreen.routeName);
                                break;
                              case 7:
                                Navigator.pushNamed(
                                    context, ProfileScreen.routeName);
                                break;
                            }
                          },
                          child: Column(
                            children: [
                              Container(
                                child: Card(
                                  color: ColorConfig.primaryColor,
                                  elevation: 5,
                                  child: Image.asset(
                                    images[index],
                                    fit: BoxFit.cover,
                                    height: 85,
                                    width: 85,
                                  ),
                                ),
                              ),
                              Text(
                                title[index],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      childCount: 8,
                    ),
                    padding: const EdgeInsets.all(10),
                    shrinkWrap: true,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
