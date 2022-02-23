import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';

class EditVisitedLead extends StatefulWidget {
  final String id;
  const EditVisitedLead({Key? key, required this.id}) : super(key: key);
  static const routeName = '/edit-visited-lead';

  @override
  _EditVisitedLeadState createState() => _EditVisitedLeadState();
}

class _EditVisitedLeadState extends State<EditVisitedLead> {
  final _addressFocusNode = FocusNode();
  final _contactnumberFocusNode = FocusNode();
  final _companynameFocusNode = FocusNode();
  final _productnameFocusNode = FocusNode();
  final _decisionFocusNode = FocusNode();
  final _datetimeFocusNode = FocusNode();

  @override
  void dispose() {
    _addressFocusNode.dispose();
    _contactnumberFocusNode.dispose();
    _companynameFocusNode.dispose();
    _productnameFocusNode.dispose();
    _decisionFocusNode.dispose();
    _datetimeFocusNode.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  CollectionReference selfvisitedlead =
      FirebaseFirestore.instance.collection('selfvisitedlead');

  Future<void> updateSelfvisitedLead(id, name, address, contact, companyName,product,decision,datetime) {
    return selfvisitedlead
        .doc(id)
        .update({
          'name': name,
          'address': address,
          'contact': contact,
          'companyname': companyName,
          'product': product,
          'decision': decision,
          'datetime': datetime,
        })
        .then((value) => print("selfvisitedlead Updated"))
        .catchError(
          (error) => print("Failed to update selfvisitedlead:$error"),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.primaryColor,
        title: const Text(
          "Edit Visited Lead",
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
                .collection('selfvisitedlead')
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
              var selfleadName = data['name'];
              var selfleadAddress = data['address'];
              var selfleadContact = data['contact'];
              var selfleadcompanyName = data['companyname'];
              var product=data['product'];
              var decision=data['decision'];
              var datetime=data['datetime'];

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
                        initialValue: selfleadContact,
                        autofocus: false,
                        keyboardType: TextInputType.name,
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
                        initialValue: selfleadcompanyName,
                        autofocus: false,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_productnameFocusNode);
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
                            return 'Please enter company name ';
                          }
                          return null;
                        },
                        focusNode: _companynameFocusNode,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: product,
                        onChanged: (value) => product=value,
                        autofocus: false,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_decisionFocusNode);
                        },
                        decoration: const InputDecoration(
                          labelText: 'Product Name: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter product name';
                          }
                          return null;
                        },
                        focusNode: _productnameFocusNode,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: decision,
                        onChanged: (value) => decision=value,
                        autofocus: false,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_datetimeFocusNode);
                        },
                        decoration: const InputDecoration(
                          labelText: 'Decision: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your decision';
                          }
                          return null;
                        },
                        focusNode: _decisionFocusNode,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: datetime,
                        onChanged: (value) => datetime=value,
                        autofocus: false,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          labelText: 'Date Time: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Date and time';
                          }
                          return null;
                        },
                        focusNode: _datetimeFocusNode,
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
                                  updateSelfvisitedLead(
                                      widget.id,
                                      selfleadName,
                                      selfleadAddress,
                                      selfleadContact,
                                      selfleadcompanyName,
                                      product,
                                      decision,
                                      datetime,
                                      );
                                });
                                Navigator.of(context).pop();
                              }
                            },
                            child: const Text(
                              'Save',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
