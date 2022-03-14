import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);
  static const routeName = '/add-employee';

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  final _addressFocusNode = FocusNode();
  final _contactnumberFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  var empName = '';
  var empAddress = '';
  var empContact = '';
  var empEmail = '';

  final empNameController = TextEditingController();
  final empAddressController = TextEditingController();
  final empContactController = TextEditingController();
  final empEmailController = TextEditingController();

  @override
  void dispose() {
    //focuseNode
    _addressFocusNode.dispose();
    _contactnumberFocusNode.dispose();
    _emailFocusNode.dispose();

    //Controller
    empAddressController.dispose();
    empContactController.dispose();
    empNameController.dispose();
    empEmailController.dispose();
    super.dispose();
  }

  CollectionReference employee =
      FirebaseFirestore.instance.collection('employee');

  Future<void> addEmployee() {
    return employee
        .add({
          'empname': empName,
          'empaddress': empAddress,
          'empcontact': empContact,
          'empemail': empEmail,
        })
        .then((value) => print('employee Added'))
        .catchError((error) => print('Failed to Add Employee: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.appbarColor,
        title: Text(
          'Add Employee',
          style: TextStyle(
            fontSize: 25,
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
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_addressFocusNode);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Employee Name: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    controller: empNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter employee name';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    maxLines: 2,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context)
                          .requestFocus(_contactnumberFocusNode);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Address: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    controller: empAddressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Address';
                      }
                      if (value.length < 20) {
                        return 'Should be at least 20 characters long';
                      }
                      return null;
                    },
                    focusNode: _addressFocusNode,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context)
                          .requestFocus(_emailFocusNode);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Contact Number: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    controller: empContactController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter contact number';
                      }
                      if (value.length != 10){
                        return 'Contact number must be 10 digit';
                      }
                      return null;
                    },
                    focusNode: _contactnumberFocusNode,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    maxLines: 2,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      labelText: 'Email: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    controller: empEmailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Email';
                      } else if (!value.contains('@')) {
                        return 'not valid email';
                      } else if (!value.contains('.com')) {
                        return 'not valid email';
                      } else {
                        return null;
                      }
                    },
                    focusNode: _emailFocusNode,
                  ),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: ColorConfig.appbarColor,
                        ),
                        onPressed: () {
                          // Validate returns true if the form is valid, otherwise false.
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              empName = empNameController.text;
                              empAddress = empAddressController.text;
                              empContact = empContactController.text;
                              empEmail = empEmailController.text;

                              addEmployee();
                            });
                          }
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: ColorConfig.appbartextColor,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => {},
                        child: Text(
                          'Reset',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: ColorConfig.appbartextColor,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: ColorConfig.appbarColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
