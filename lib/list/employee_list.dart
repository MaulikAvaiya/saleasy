import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/EditForms/edit_employee.dart';
import 'package:saleasy/constant/color_config.dart';

import '../DetailScreen/employee_detail.dart';
import '../controller/user_controller.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({Key? key}) : super(key: key);

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  final Stream<QuerySnapshot> employeeStream =
      FirebaseFirestore.instance.collection(user).doc(userId).collection('employee').snapshots();

  CollectionReference employee =
      FirebaseFirestore.instance.collection(user).doc(userId).collection('employee');

  Future<void> deleteEmployee(id) {
    return employee
        .doc(id)
        .delete()
        .then((value) => debugPrint('employee deleted'))
        .catchError((error) => debugPrint('Fail: $error'));
  }

  @override
  Widget build(BuildContext context) {
    double screenWitdth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    debugPrint(screenWitdth.toString());
    debugPrint(screenHeight.toString());
    return StreamBuilder<QuerySnapshot>(
      stream: employeeStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          debugPrint('some thing went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        // final List storeDocs = [];
        // snapshot.data!.docs.map((DocumentSnapshot document) {
        //   Map student = document.data() as Map<String, dynamic>;
        //   storeDocs.add(student);
        // }).toList();

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            return Dismissible(
              background: Container(
                color: Theme.of(context).errorColor,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: screenHeight * 0.05,
                ),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: screenWitdth * 0.05),
                margin: EdgeInsets.symmetric(
                  horizontal: screenWitdth * 0.019,
                  vertical: screenHeight * 0.025,
                ),
              ),
              direction: DismissDirection.endToStart,
              confirmDismiss: (direction) {
                return showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Are you sure?'),
                    content: const Text(
                      'Do you want to remove the item from the cart?',
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: const Text('No'),
                        onPressed: () {
                          Navigator.of(ctx).pop(false);
                        },
                      ),
                      FlatButton(
                        child: const Text('Yes'),
                        onPressed: () {
                          deleteEmployee(snapshot.data!.docs[index].id);
                          Navigator.of(ctx).pop(true);
                        },
                      ),
                    ],
                  ),
                );
              },
              key: const ValueKey(null),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return EmployeeDetail(
                        empname: snapshot.data!.docs[index]['empname'],
                        contact: snapshot.data!.docs[index]['empcontact'],
                        email: snapshot.data!.docs[index]['empemail'],
                        address: snapshot.data!.docs[index]['empaddress'],
                        
                        );
                  }));
                },
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWitdth * 0.025,
                      vertical: screenHeight * 0.025,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: screenWitdth * 0.02,
                            right: screenWitdth * 0.04,
                          ),
                          child: Card(
                            elevation: 5,
                            color: ColorConfig.primaryColor,
                            child: Image.asset(
                              "assets/images/employee.png",
                              width: 60,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWitdth * 0.52,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data!.docs[index]['empname'],
                                style:
                                    TextStyle(fontSize: screenHeight * 0.035),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: screenHeight * 0.012),
                                child: Text(
                                  snapshot.data!.docs[index]['empcontact'],
                                  style:
                                      TextStyle(fontSize: screenHeight * 0.030),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditEmployee(
                                  id: snapshot.data!.docs[index].id,
                                ),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWitdth * 0.008,
                                vertical: screenHeight * 0.006,
                              ),
                              child: Icon(
                                Icons.edit,
                                color: ColorConfig.appbarColor,
                                size: screenHeight * 0.05,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
