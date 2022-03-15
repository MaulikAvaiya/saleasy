import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';

class AddCompanyTask extends StatefulWidget {
  String id;
  String name;
  String address;
  String contact;
  String companyName;
  AddCompanyTask({
    Key? key,
    required this.id,
    required this.name,
    required this.address,
    required this.contact,
    required this.companyName,
  }) : super(key: key);
  static const routeName = '/add-task';

  @override
  _AddCompanyTaskState createState() => _AddCompanyTaskState();
}

class _AddCompanyTaskState extends State<AddCompanyTask> {

var _mySelection;

  var task = '';
  var tasktype = '';
  var date = '';

  final taskController = TextEditingController();
  final tasktypeController = TextEditingController();

  CollectionReference companytask =
      FirebaseFirestore.instance.collection('companytask');

  Future<void> addCompanyTask() {
    return companytask
        .add({
          'name': widget.name,
          'address': widget.address,
          'contact': widget.contact,
          'companyname': widget.companyName,
          'employee':_mySelection,
          'task': task,
          'tasktype': tasktype,
          'datetime': date,
        })
        .then((value) => print('companytask Added'))
        .catchError((error) => print('Failed to Add companytask: $error'));
  }

  final _addressFocusNode = FocusNode();
  final _contactnumberFocusNode = FocusNode();
  final _companynameFocusNode = FocusNode();
  final _datetimeFocusNode = FocusNode();
  final _taskdetailFocusNode = FocusNode();
  final _typeFocusNode = FocusNode();

  @override
  void dispose() {
    _addressFocusNode.dispose();
    _contactnumberFocusNode.dispose();
    _companynameFocusNode.dispose();
    _datetimeFocusNode.dispose();
    _taskdetailFocusNode.dispose();
    _typeFocusNode.dispose();

    super.dispose();
  }

  
  final Stream<QuerySnapshot> employeeStream =
      FirebaseFirestore.instance.collection('employee').snapshots();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.appbarColor,
        title: Text(
          "Add companytask",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: ColorConfig.appbartextColor,
          ),
        ),
      ),
      body:StreamBuilder<QuerySnapshot>(
          stream: employeeStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('some thing went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
return Container(
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
                    initialValue: widget.name,
                    autofocus: false,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_addressFocusNode);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Lead Name: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter lead name';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    initialValue: widget.address,
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
                    initialValue: widget.contact,
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_companynameFocusNode);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Contact Number: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter contact number ';
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
                    initialValue: widget.companyName,
                    autofocus: false,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_datetimeFocusNode);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Company Name: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter company name';
                      }
                      return null;
                    },
                    focusNode: _companynameFocusNode,
                  ),
                ),
                 Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.grey,
                          width: 0.8,
                        )),
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: DropdownButton<dynamic>(
                            underline: Container(color: Colors.transparent),
                            isDense: true,
                            hint: _mySelection != null
                                ? Text(_mySelection)
                                : Text('select employee name'),
                            value: _mySelection,
                            onChanged: (dynamic newValue) {
                              setState(() {
                                _mySelection = newValue;
                              });

                              debugPrint(_mySelection);
                            },
                            icon: Icon(Icons.arrow_drop_down_circle_rounded),
                            isExpanded: true,
                            items: snapshot.data!.docs
                                .map((DocumentSnapshot snapshot) {
                              return DropdownMenuItem<dynamic>(
                                value: snapshot[
                                    'empname'], //snapshot['id'].toString(),
                                child: Text(
                                  snapshot["empname"],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.datetime,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_taskdetailFocusNode);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Date Time: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter date and time';
                      }
                      return null;
                    },
                    focusNode: _datetimeFocusNode,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.datetime,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_typeFocusNode);
                    },
                    controller: taskController,
                    decoration: const InputDecoration(
                      labelText: 'Task Detail: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter task detail';
                      }
                      return null;
                    },
                    focusNode: _taskdetailFocusNode,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.datetime,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      labelText: 'Type: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    controller: tasktypeController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter type';
                      }
                      return null;
                    },
                    focusNode: _typeFocusNode,
                  ),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, otherwise false.
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              task = taskController.text;
                              tasktype = tasktypeController.text;
                              addCompanyTask();
                            });
                          }
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => {},
                        child: const Text(
                          'Reset',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
          }
      ),
    );
  }
}