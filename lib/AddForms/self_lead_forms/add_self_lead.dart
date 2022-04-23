import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';

import '../../controller/user_controller.dart';

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

  final Stream<QuerySnapshot> employeeStream = FirebaseFirestore.instance
      .collection('admin')
      .doc(userId)
      .collection('employee')
      .snapshots();

  CollectionReference selflead = FirebaseFirestore.instance
      .collection(user)
      .doc(userId)
      .collection('selflead');
      
  Future<void> addSelfLead() {
    return selflead
        .add({
          'name': leadName,
          'address': leadAddress,
          'contact': leadContact,
          'companyname': leadCompanyName,
          'employee': _mySelection,
        })
        .then((value) => debugPrint('lead Added'))
        .catchError((error) => debugPrint('Failed to Add lead: $error'));
  }
  Future<void> addSelfLead1() {
    return selflead
        .add({
          'name': leadName,
          'address': leadAddress,
          'contact': leadContact,
          'companyname': leadCompanyName,
        
        })
        .then((value) => debugPrint('lead Added'))
        .catchError((error) => debugPrint('Failed to Add lead: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.appbarColor,
        title: Text(
          "Add Self Lead",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: ColorConfig.appbartextColor,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
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

            return Container(
              color: ColorConfig.primaryColor,
              child: Form(
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
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 15),
                          ),
                          controller: leadNameController,
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
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 15),
                          ),
                          controller: leadContactController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter contact number ';
                            }
                            if (value.length != 10) {
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
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 15),
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
                    user!='admin'? SizedBox() :Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.grey,
                          width: 0.8,
                        )),
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: DropdownButton<dynamic>(
                            underline: Container(color: Colors.transparent),
                            isDense: true,
                            hint: _mySelection != null
                                ? Text(_mySelection)
                                : const Text('select employee name'),
                            value: _mySelection,
                            onChanged: (dynamic newValue) {
                              setState(() {
                                _mySelection = newValue;
                              });

                              debugPrint(_mySelection);
                            },
                            icon: const Icon(
                                Icons.arrow_drop_down_circle_rounded),
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
                                    leadName = leadNameController.text;
                                    leadAddress = leadAddressController.text;
                                    leadContact = leadContactController.text;
                                    leadCompanyName =
                                        leadCompanyNameController.text;
                                    

                                   user!='admin'?addSelfLead1() :addSelfLead();
                                    Navigator.of(context).pop();
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
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
