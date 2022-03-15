import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';

class EditSelfLead extends StatefulWidget {
  final String id;
  const EditSelfLead({Key? key, required this.id}) : super(key: key);
  static const routeName = '/edit-self-lead';

  @override
  _EditSelfLeadState createState() => _EditSelfLeadState();
}

class _EditSelfLeadState extends State<EditSelfLead> {
  final _addressFocusNode = FocusNode();
  final _contactnumberFocusNode = FocusNode();
  final _companynameFocusNode = FocusNode();

  @override
  void dispose() {
    _addressFocusNode.dispose();
    _contactnumberFocusNode.dispose();
    _companynameFocusNode.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  CollectionReference selflead =
      FirebaseFirestore.instance.collection('selflead');

  Future<void> updateSelfLead(id, name, address, contact, companyName) {
    return selflead
        .doc(id)
        .update({
          'name': name,
          'address': address,
          'contact': contact,
          'companyname': companyName,
        })
        .then((value) => print("selflead Updated"))
        .catchError(
          (error) => print("Failed to update selflead:$error"),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.appbarColor,
        title: Text(
          "Edit Self Lead",
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
          child: FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('selflead')
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

              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: selfleadName,
                        onChanged: (value) => selfleadName = value,
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
                        initialValue: selfleadAddress,
                        onChanged: (value) => selfleadAddress = value,
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
                        initialValue: selfleadContact,
                        onChanged: (value) => selfleadContact = value,
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
                        initialValue: selfleadcompanyName,
                        onChanged: (value) => selfleadcompanyName = value,
                        autofocus: false,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.done,
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
                    Row(
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
                                updateSelfLead(
                                    widget.id,
                                    selfleadName,
                                    selfleadAddress,
                                    selfleadContact,
                                    selfleadcompanyName);
                              });
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: ColorConfig.appbartextColor,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
