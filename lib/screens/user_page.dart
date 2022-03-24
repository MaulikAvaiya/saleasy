import 'package:flutter/material.dart';
import 'package:saleasy/auth/signup.dart';
import 'package:saleasy/controller/user_controller.dart';

class UserPage extends StatelessWidget {
  const UserPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('select user screen'),),
      body: Container(
        child: Column(
          children: [
            Text('use as :'),
            Row(children: [
              GestureDetector(
                onTap: () => isadmin=true,
                child: Text('admin'),
              ),
              GestureDetector(
                onTap: () => isUser=true,
                child: Container(
                  child: const Text('user'),
                ),
              ),
            ],),
            TextButton(onPressed: (){
              Navigator.of(context).pushNamed(Signup.routeName);
            }, child: const Text('continue')),
          ],
        ),
      ),
    );
  }
}