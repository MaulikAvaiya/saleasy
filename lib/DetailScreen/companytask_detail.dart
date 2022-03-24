import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';

class CompanyTaskDetail extends StatefulWidget {
  final String name;
  final String tasktype;
  
  const CompanyTaskDetail({ Key? key ,required this.name, required this.tasktype}) : super(key: key);
  static const routeName='/companytask_detail';
  @override
  _CompanyTaskDetailState createState() => _CompanyTaskDetailState();
}

class _CompanyTaskDetailState extends State<CompanyTaskDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.appbarColor,
        title: Text(
          'Company Task Detail',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: ColorConfig.appbartextColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: ColorConfig.primaryColor,
          padding: const EdgeInsets.all(6),
          height: 700,
          width: 430,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
                width: 400,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Task Detail:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: ColorConfig.textColor,
                          ),
                        ),
                        const Text(
                          "Type:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.tasktype,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: ColorConfig.textColor,
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
      ),
    );
  }
}

