import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';

import '../controller/user_controller.dart';

class SelfTaskDetail extends StatefulWidget {
  final String id;

  const SelfTaskDetail({Key? key, required this.id,})
      : super(key: key);
  static const routeName = '/Salftask_detail';

  @override
  _SelfTaskDetailState createState() => _SelfTaskDetailState();
}

class _SelfTaskDetailState extends State<SelfTaskDetail> {

  CollectionReference selftask =
      FirebaseFirestore.instance.collection(user)
      .doc(userId).collection('selftask');

  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.appbarColor,
        title: Text(
          'Selftask Detail',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: ColorConfig.appbartextColor,
          ),
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: selftask.doc(widget.id).get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            debugPrint('some thing went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
           Timestamp timestamp = snapshot.data!['datetime'];
            DateTime myDateTime = timestamp.toDate();
          return SingleChildScrollView(
        child: Container(
          color: ColorConfig.primaryColor,
          padding: const EdgeInsets.all(6),
          
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight*0.9,
                width:screenWidth*0.9,
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
                              "Lead Name:",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              snapshot.data!['name'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: ColorConfig.textColor,
                              ),
                            ),
                            const Text(
                              "Address:",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              snapshot.data!['address'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: ColorConfig.textColor,
                              ),
                            ),
                            const Text(
                              "Company Name:",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              snapshot.data!['companyname'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: ColorConfig.textColor,
                              ),
                            ),
                            const Text(
                              "Contact Number:",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              snapshot.data!['contact'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: ColorConfig.textColor,
                              ),
                            ),
                           
                        const Text(
                          "Task Detail:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          snapshot.data!['tasktype'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: ColorConfig.textColor,
                          ),
                        ),
                       
                        const Text(
                          "Date:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${myDateTime.day}/${myDateTime.month}/${myDateTime.year}',
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
      );
        }
      ),
    );
  }
}
