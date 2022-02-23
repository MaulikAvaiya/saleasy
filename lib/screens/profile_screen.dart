import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/Profile-screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: const Center(
        child: Text('this is Profile screen'),
      ),
    );
  }
}
