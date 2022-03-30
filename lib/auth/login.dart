import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/auth/signup.dart';

import 'package:saleasy/controller/user_controller.dart';
import 'package:saleasy/screens/home_screen.dart';
import 'package:saleasy/screens/user_home_page.dart';

import 'package:saleasy/constant/color_config.dart';

import 'forgot_password.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _passwordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  var email = "";
  var password = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => isadmin ? const HomeScreen() : UserHomePage(),
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }

    //  on FirebaseAuthException catch (e) {
    //  if (e.code == 'user-not-found') {
    //    debugPrint("No User Found for that Email");
    //  ScaffoldMessenger.of(context).showSnackBar(
    //  const SnackBar(
    //  backgroundColor: Colors.orangeAccent,
    //  content: Text(
    //      "No User Found for that Email",
    //    style: TextStyle(fontSize: 18.0, color: Colors.black),
    //   ),
    //   ),
    // );
    //  } else if (e.code == 'wrong-password') {
    // debugPrint("Wrong Password Provided by User");
    //  ScaffoldMessenger.of(context).showSnackBar(
    //    const SnackBar(
    //    backgroundColor: Colors.orangeAccent,
    //   content: Text(
    //    "Wrong Password Provided by User",
    //     style: TextStyle(fontSize: 18.0, color: Colors.black),
    //   ),
    //    ),
    // );
    //   }
    // }
  }

  @override
  void dispose() {
    // FocusNode
    _passwordFocusNode.dispose();

    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.appbarColor,
        title: Text(
          "User Login",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: ColorConfig.appbartextColor,
          ),
        ),
      ),
      body: Container(
        color: ColorConfig.primaryColor,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Email';
                      } else if (!value.contains('@')) {
                        return 'Please Enter Valid Email';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    obscureText: true,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      labelText: 'Password: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                    focusNode: _passwordFocusNode,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 60.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: ColorConfig.appbarColor,
                        ),
                        onPressed: () {
                          // Validate returns true if the form is valid, otherwise false.
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              email = emailController.text;
                              password = passwordController.text;
                            });
                            userLogin();
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotPassword(),
                            ),
                          )
                        },
                        child: const Text(
                          'Forgot Password ?',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an Account? ",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () => {
                        Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, a, b) => const Signup(),
                              transitionDuration: const Duration(seconds: 0),
                            ),
                            (route) => false)
                      },
                      child: const Text(
                        'Signup',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // TextButton(
                    //   onPressed: () => {
                    //     Navigator.pushAndRemoveUntil(
                    //         context,
                    //         PageRouteBuilder(
                    //           pageBuilder: (context, a, b) => UserMain(),
                    //           transitionDuration: Duration(seconds: 0),
                    //         ),
                    //         (route) => false)
                    //   },
                    //   child: Text('Dashboard'),
                    // ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
