import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';
import 'package:saleasy/list/self_list/self_visited_list.dart';

class SelfVisitedScreen extends StatelessWidget {
  static const routeName = '/self_visited_screen';
  const SelfVisitedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.primaryColor,
      appBar: AppBar(
        title: const Text(
          'visited Lead ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: SelfVisitedList(),
    );
  }
}
