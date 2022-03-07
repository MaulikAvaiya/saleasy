import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';

class EditCompanyTask extends StatefulWidget {
  final String id;
  const EditCompanyTask({
    Key? key,
    required this.id,
  }) : super(key: key);
  static const routeName = '/add-task';

  @override
  _EditCompanyTaskState createState() => _EditCompanyTaskState();
}

class _EditCompanyTaskState extends State<EditCompanyTask> {
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

  CollectionReference Companytask =
      FirebaseFirestore.instance.collection('companytask');

  Future<void> updateComapnyTask(
      id, name, address, contact, companyName, task, tasktype, datetime) {
    return Companytask
        .doc(id)
        .update({
          'name': name,
          'address': address,
          'contact': contact,
          'companyname': companyName,
          'task': task,
          'tasktype': tasktype,
          'datetime': datetime,
        })
        .then((value) => print("Companytask Updated"))
        .catchError(
          (error) => print("Failed to update Companytask:$error"),
        );
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConfig.primaryColor,
          title: const Text(
            "Edit Company Task",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        body: Form(
          key: _formKey,
          child: FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection('Companytask')
                  .doc(widget.id)
                  .get(),
              builder: (_, snapshot) {
                if (snapshot.hasError) {
                  print('Something went wrong.');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                var selfleadName = data['name'];
                var selfleadAddress = data['address'];
                var selfleadContact = data['contact'];
                var selfleadcompanyName = data['companyname'];
                var task = data['task'];
                var tasktype = data['tasktype'];
                var datetime = data['datetime'];

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          initialValue: selfleadName,
                          autofocus: false,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_addressFocusNode);
                          },
                          decoration: const InputDecoration(
                            labelText: 'Lead Name: ',
                            labelStyle: TextStyle(fontSize: 20.0),
                            border: OutlineInputBorder(),
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 15),
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
                          initialValue: selfleadAddress,
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
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 15),
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
                          initialValue: selfleadContact,
                          autofocus: false,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_companynameFocusNode);
                          },
                          decoration: const InputDecoration(
                            labelText: 'Contact Number: ',
                            labelStyle: TextStyle(fontSize: 20.0),
                            border: OutlineInputBorder(),
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 15),
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
                          initialValue: selfleadcompanyName,
                          autofocus: false,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_datetimeFocusNode);
                          },
                          decoration: const InputDecoration(
                            labelText: 'Company Name: ',
                            labelStyle: TextStyle(fontSize: 20.0),
                            border: OutlineInputBorder(),
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 15),
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
                          initialValue: datetime,
                          autofocus: false,
                          keyboardType: TextInputType.datetime,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_taskdetailFocusNode);
                          },
                          decoration: const InputDecoration(
                            labelText: 'Date Time: ',
                            labelStyle: TextStyle(fontSize: 20.0),
                            border: OutlineInputBorder(),
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 15),
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
                          initialValue: task,
                          onChanged: (value)=>task=value,
                          autofocus: false,
                          keyboardType: TextInputType.datetime,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_typeFocusNode);
                          },
                          decoration: const InputDecoration(
                            labelText: 'Task Detail: ',
                            labelStyle: TextStyle(fontSize: 20.0),
                            border: OutlineInputBorder(),
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 15),
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
                          initialValue: tasktype,
                          onChanged: (value)=>tasktype=value,
                          autofocus: false,
                          keyboardType: TextInputType.datetime,
                          textInputAction: TextInputAction.done,
                          decoration: const InputDecoration(
                            labelText: 'Type: ',
                            labelStyle: TextStyle(fontSize: 20.0),
                            border: OutlineInputBorder(),
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 15),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter type';
                            }
                            return null;
                          },
                          focusNode: _typeFocusNode,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, otherwise false.
                             if (_formKey.currentState!.validate()) {
                              setState(() {
                                updateComapnyTask(
                                    widget.id,
                                    selfleadName,
                                    selfleadAddress,
                                    selfleadContact,
                                    selfleadcompanyName,
                                    task,
                                    tasktype,
                                    datetime,
                                    );
                              });
                              Navigator.of(context).pop();
                            }
                            },
                            child: const Text(
                              'Save',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ));
  }
}
