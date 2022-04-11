import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';
import 'package:saleasy/deletefunction/companyleaddelete.dart';
import 'package:saleasy/screens/CompanyLead/companylead_screen.dart';

import '../../controller/user_controller.dart';

class AddCompanyVisitedLead extends StatefulWidget {
  final String id;
  final String name;
  final String address;
  final String contact;
  final String companyName;
  const AddCompanyVisitedLead({
    Key? key,
    required this.id,
    required this.name,
    required this.address,
    required this.contact,
    required this.companyName,
  }) : super(key: key);
  static const routeName = '/add-companyvisited-lead';

  @override
  _AddCompanyVisitedLeadState createState() => _AddCompanyVisitedLeadState();
}

class _AddCompanyVisitedLeadState extends State<AddCompanyVisitedLead> {


   var _mySelection;

  var leadName = '';
  var leadAddress = '';
  var leadContact = '';
  var leadCompanyName = '';
  // var dateTime = '';
  var decision = '';
  var product = '';

  final leadNameController = TextEditingController();
  final leadAddressController = TextEditingController();
  final leadContactController = TextEditingController();
  final leadCompanyNameController = TextEditingController();
  final leadEmpNameController = TextEditingController();
  final dateTimeController = TextEditingController();
  final productController = TextEditingController();
  final decisionController = TextEditingController();

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

  String date = "";
  DateTime selectedDate = DateTime.now();

  CollectionReference companyvisitedlead =
  FirebaseFirestore.instance.collection('admin').doc(userId).collection('companyvisitedlead');




  Future<void> addcompanyvisitedlead() {
    return companyvisitedlead
        .add({
          'name': widget.name,
          'address': widget.address,
          'contact': widget.contact,
          'companyname': widget.companyName,
          'product': user!='admin'? product:_mySelection,
          'decision': decision,
          'datetime': selectedDate,
        })
        .then((value) => debugPrint('companyvisitedlead Added'))
        .catchError(
            (error) => debugPrint('Failed to Add companyvisitedlead: $error'));
  }

  final _formKey = GlobalKey<FormState>();

  final Stream<QuerySnapshot> productStream =
      FirebaseFirestore.instance.collection(user).doc(userId).collection('product').snapshots();

 void  _selectDate(BuildContext context) async {
    final DateTime? selected =await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2050),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.appbarColor,
        title: Text(
          "Add company VisitedLead",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: ColorConfig.appbartextColor,
          ),
        ),
      ),
      body:StreamBuilder<QuerySnapshot>(
          stream: productStream,
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
                    //  controller: leadNameController,
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
                    // controller: leadAddressController,
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
                    // controller: leadContactController,
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
                    initialValue: widget.companyName,
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
                    //  controller: leadCompanyNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter company name ';
                      }
                      return null;
                    },
                    focusNode: _companynameFocusNode,
                  ),
                ),
                user!='admin'?Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          autofocus: false,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_productnameFocusNode);
                          },
                          decoration: const InputDecoration(
                            labelText: 'Product Name: ',
                            labelStyle: TextStyle(fontSize: 20.0),
                            border: OutlineInputBorder(),
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 15),
                          ),
                           controller: productController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Product name ';
                            }
                            return null;
                          },
                          focusNode: _productnameFocusNode,
                        ),
                      ): Container(
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
                                : const Text('select product name'),
                            value: _mySelection,
                            onChanged: (dynamic newValue) {
                              setState(() {
                                _mySelection = newValue;
                              });

                              debugPrint(_mySelection);
                            },
                            icon: const Icon(Icons.arrow_drop_down_circle_rounded),
                            isExpanded: true,
                            items: snapshot.data!.docs
                                .map((DocumentSnapshot snapshot) {
                              return DropdownMenuItem<dynamic>(
                                value: snapshot[
                                    'name'], //snapshot['id'].toString(),
                                child: Text(
                                  snapshot["name"],
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
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_datetimeFocusNode);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Decision: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    controller: decisionController,
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
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        )),
                        child: Padding(
                          padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          selectedDate!=null?Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}") :
                            const Text('please select date'),
                            GestureDetector(
                                   onTap: (() => setState(() {
                                        _selectDate(context);
                                      })),
                                  child: const Icon(Icons.date_range)),
                      ],),

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
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  // leadName=widget.name;
                                  // leadAddress=widget.ad;
                                  // leadContact=leadContactController.text;
                                  // leadCompanyName=leadCompanyNameController.text;
                                  product = productController.text;
                                  decision = decisionController.text;
                                  //  selectedDate =dateTimeController.text as DateTime;

                                  addcompanyvisitedlead();
                                  Companyleadelete()
                                      .deletecompanylead(widget.id);
                                  Navigator.of(context).popAndPushNamed(
                                      CompanyLeadScreen.routeName);
                                });
                                //  SelfLeadList().
                              }
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
          }
      ),
    );
  }
}
