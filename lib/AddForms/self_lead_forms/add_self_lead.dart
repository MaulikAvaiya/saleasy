import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';

class AddSelfLead extends StatefulWidget {
  const AddSelfLead({Key? key}) : super(key: key);
  static const routeName = '/add-self-lead';

  @override
  _AddSelfLeadState createState() => _AddSelfLeadState();
}

class _AddSelfLeadState extends State<AddSelfLead> {
  var _mySelection;

  var leadName = '';
  var leadAddress = '';
  var leadContact = '';
  var leadCompanyName = '';
  var leadEmpName = '';

  final leadNameController = TextEditingController();
  final leadAddressController = TextEditingController();
  final leadContactController = TextEditingController();
  final leadCompanyNameController = TextEditingController();
  final leadEmpNameController = TextEditingController();

  final _addressFocusNode = FocusNode();
  final _contactnumberFocusNode = FocusNode();
  final _companynameFocusNode = FocusNode();
  final _employeenameFocusNode = FocusNode();

  @override
  void dispose() {
    _addressFocusNode.dispose();
    _contactnumberFocusNode.dispose();
    _companynameFocusNode.dispose();
    _employeenameFocusNode.dispose();

    leadNameController.dispose();
    leadAddressController.dispose();
    leadContactController.dispose();
    leadCompanyNameController.dispose();
    leadEmpNameController.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  final Stream<QuerySnapshot> employeeStream =
      FirebaseFirestore.instance.collection('employee').snapshots();

  CollectionReference selflead =
      FirebaseFirestore.instance.collection('selflead');

  Future<void> addSelfLead() {
    return selflead
        .add({
          'name': leadName,
          'address': leadAddress,
          'contact': leadContact,
          'companyname': leadCompanyName,
          'employee': leadEmpName,
        })
        .then((value) => print('lead Added'))
        .catchError((error) => print('Failed to Add lead: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.primaryColor,
        title: const Text(
          "Add Self Lead",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
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

            return Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
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
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: leadNameController,
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
                        controller: leadAddressController,
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
                              .requestFocus(_companynameFocusNode);
                        },
                        decoration: const InputDecoration(
                          labelText: 'Contact Number: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: leadContactController,
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
                        autofocus: false,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_employeenameFocusNode);
                        },
                        decoration: const InputDecoration(
                          labelText: 'Company Name: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: leadCompanyNameController,
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
                      child: DropdownButton<dynamic>(
                        isDense: true,
                        hint:_mySelection!=null? Text(_mySelection):Text('select employee name'),
                        value: _mySelection,
                        onChanged: (dynamic newValue) {
                          setState(() {
                            _mySelection = newValue;
                          });
                          
                          print(_mySelection);
                        },
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
                      //   child: TextFormField(
                      //     autofocus: false,
                      //     keyboardType: TextInputType.name,
                      //     textInputAction: TextInputAction.done,
                      //     decoration: const InputDecoration(
                      //       labelText: 'Employee Name: ',
                      //       labelStyle: TextStyle(fontSize: 20.0),
                      //       border: OutlineInputBorder(),
                      //       errorStyle:
                      //           TextStyle(color: Colors.redAccent, fontSize: 15),
                      //     ),
                      //     controller: leadEmpNameController,
                      //     validator: (value) {
                      //       if (value == null || value.isEmpty) {
                      //         return 'Please enter employee name';
                      //       }
                      //       return null;
                      //     },
                      //     focusNode: _employeenameFocusNode,
                      //   ),
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
                                  leadName = leadNameController.text;
                                  leadAddress = leadAddressController.text;
                                  leadContact = leadContactController.text;
                                  leadCompanyName =
                                      leadCompanyNameController.text;
                                  leadEmpName = leadEmpNameController.text;

                                  addSelfLead();
                                  Navigator.of(context).pop();
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
