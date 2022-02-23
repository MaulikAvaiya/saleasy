import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditEmployee extends StatefulWidget {
  final String id;
  const EditEmployee({Key? key,required this.id}) : super(key: key);

  @override
  State<EditEmployee> createState() => _EditEmployeeState();
}

class _EditEmployeeState extends State<EditEmployee> {
  final _addressFocusNode = FocusNode();
  final _contactnumberFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  void dispose() {
    _addressFocusNode.dispose();
    _contactnumberFocusNode.dispose();
  }

    CollectionReference employee =
        FirebaseFirestore.instance.collection('employee');
  

    Future<void> updateEmployee(id, name, address, contact, email) {
      return employee
          .doc(id)
          .update({
            'empname': name,
            'empaddress': address,
            'empcontact': contact,
            'empemail': email,
          })
          .then((value) => print("employee Updated"))
          .catchError(
            (error) => print("Failed to update employee:$error"),
          );
    }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('update employee'),),
    
    
    body:
    Form(
      key: _formKey,
      child: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection('employee')
              .doc(widget.id)
              .get(),
          builder: (_, snapshot) {
            if (snapshot.hasError) {
              print('Something went wrong.');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            var empName = data['empname'];
            var empAddress = data['empaddress'];
            var empContact = data['empcontact'];
            var empEmail = data['empemail'];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      initialValue: empName,
                      onChanged: (value) => empName = value,
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
                      initialValue: empAddress,
                      onChanged: (value) => empAddress = value,
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
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      initialValue: empContact,
                      onChanged: (value) => empContact = value,
                      autofocus: false,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        labelText: 'Contact Number: ',
                        labelStyle: TextStyle(fontSize: 20.0),
                        border: OutlineInputBorder(),
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter contact number';
                        }
                        return null;
                      },
                      focusNode: _contactnumberFocusNode,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      initialValue: empEmail,
                      onChanged: (value) => empEmail = value,
                      autofocus: false,
                      maxLines: 2,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_contactnumberFocusNode);
                      },
                      decoration: const InputDecoration(
                        labelText: 'Email: ',
                        labelStyle: TextStyle(fontSize: 20.0),
                        border: OutlineInputBorder(),
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),

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
                      //  focusNode: _addressFocusNode,
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Validate returns true if the form is valid, otherwise false.
                            if (_formKey.currentState!.validate()) {
                             setState(() {
                                updateEmployee(widget.id, empName, empAddress,empContact,empAddress);
                              Navigator.pop(context);
                             });
                            }
                          },
                          child: const Text(
                            'update',
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
                  ),
                ],
              ),
            );
          }),
    ),
    );
  }
}
