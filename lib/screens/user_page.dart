import 'package:flutter/material.dart';
import 'package:saleasy/auth/signup.dart';
import 'package:saleasy/controller/user_controller.dart';
import '../constant/color_config.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.appbarColor,
        title: Text(
          'Select User Screen',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: ColorConfig.appbartextColor,
          ),
        ),
      ),
      body: Container(
        color: ColorConfig.primaryColor,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'Use As :',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ColorConfig.appbarColor,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => isadmin = true,
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
                              "assets/images/admin.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 150,
                            color: const Color(0xff005757).withOpacity(0.08),
                            child: const Text(
                              "Admin",
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
                    onTap: () => isUser = true,
                    child: Container(
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
                                "assets/images/user.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 150,
                              color: const Color(0xff005757).withOpacity(0.08),
                              child: const Text(
                                "User",
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
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Signup.routeName);
              },
              child: Text(
                'Continue',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ColorConfig.appbarColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
