import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';

class AddTask extends StatefulWidget {
          String id;
          String name;
          String address;
          String contact;
          String companyName;
   AddTask({Key? key,
     required this.id,
    required this.name,
    required this.address,
    required this.contact,
    required this.companyName,
  }) : super(key: key);
  static const routeName = '/add-task';

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {

var task='';
var tasktype='';
var date='';


 final taskController = TextEditingController();
  final tasktypeController = TextEditingController();

 CollectionReference selftask =
      FirebaseFirestore.instance.collection('selftask');

  Future<void> addselfTask() {
    return selftask
        .add({
          'name': widget.name,
          'address': widget.address,
          'contact': widget.contact,
          'companyname': widget.companyName,
          'task': task,
          'tasktype': tasktype,
          'datetime': date,
        })
        .then((value) => print('selftask Added'))
        .catchError((error) => print('Failed to Add selftask: $error'));
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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.primaryColor,
        title: const Text(
          "Add Task",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: Form(
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
                      return 'Please enter LeadName';
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

                            task=taskController.text;
                            tasktype=tasktypeController.text;
                            addselfTask();

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
}
