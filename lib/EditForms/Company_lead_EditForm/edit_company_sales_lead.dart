import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';

class EditCompanySalesLead extends StatefulWidget {
  final String id;
  const EditCompanySalesLead({
    Key? key,
    required this.id,
  }) : super(key: key);
  static const routeName = '/edit-Companysales-lead';

  @override
  _EditCompanySalesLeadState createState() => _EditCompanySalesLeadState();
}

class _EditCompanySalesLeadState extends State<EditCompanySalesLead> {
  final _addressFocusNode = FocusNode();
  final _contactnumberFocusNode = FocusNode();
  final _companynameFocusNode = FocusNode();
  final _productnameFocusNode = FocusNode();
  final _quantityFocusNode = FocusNode();
  final _rateFocusNode = FocusNode();
  final _amountFocusNode = FocusNode();
  final _datetimeFocusNode = FocusNode();

  @override
  void dispose() {
    _addressFocusNode.dispose();
    _contactnumberFocusNode.dispose();
    _companynameFocusNode.dispose();
    _productnameFocusNode.dispose();
    _quantityFocusNode.dispose();
    _rateFocusNode.dispose();
    _amountFocusNode.dispose();
    _datetimeFocusNode.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

   DateTime selectedDate = DateTime.now();

  var _mySelection;

  final Stream<QuerySnapshot> productStream =
      FirebaseFirestore.instance.collection('products').snapshots();

  CollectionReference companysaleslead =
      FirebaseFirestore.instance.collection('companysaleslead');

  Future<void> updateCompanysalesLead(id, name, address, contact, companyName,
      product, quantity, rate, amount, datetime) {
    return companysaleslead
        .doc(id)
        .update({
          'name': name,
          'address': address,
          'contact': contact,
          'companyname': companyName,
          'product': product,
          'quantity': quantity,
          'rate': rate,
          'amount': amount,
          'datetime': selectedDate,
        })
        .then((value) => print("selfsaleslead Updated"))
        .catchError(
          (error) => print("Failed to update selfsaleslead:$error"),
        );
  }
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
          "Edit Sales Lead",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: ColorConfig.appbartextColor,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: productStream,
          builder: (context, datasnapshot) {
            if (datasnapshot.hasError) {
              print('some thing went wrong');
            }
            if (datasnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Container(
              color: ColorConfig.primaryColor,
              child: Form(
                key: _formKey,
                child: FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('companysaleslead')
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
                      var product = data['product'];
                      var quantity = data['quantity'];
                      var amount = data['amount'];
                      var rate = data['rate'];
                      var datetime = data['datetime'];
                      selectedDate=datetime;

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 30),
                        child: ListView(
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 10.0),
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
                                    return 'Please enter lead name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 10.0),
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
                              margin:
                                  const EdgeInsets.symmetric(vertical: 10.0),
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
                                  if (value.length != 10) {
                            return 'Contact number must be 10 digit';
                          }    
                                  return null;
                                },
                                focusNode: _contactnumberFocusNode,
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: TextFormField(
                                initialValue: selfleadcompanyName,
                                autofocus: false,
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_productnameFocusNode);
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
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.grey,
                                width: 0.8,
                              )),
                              margin:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child: DropdownButton<dynamic>(
                                  underline:
                                      Container(color: Colors.transparent),
                                  isDense: true,
                                  hint: _mySelection != null
                                      ? Text(_mySelection)
                                      : Text('select product name'),
                                  value: _mySelection,
                                  onChanged: (dynamic newValue) {
                                    setState(() {
                                      _mySelection = newValue;
                                    });

                                    debugPrint(_mySelection);
                                  },
                                  icon: Icon(
                                      Icons.arrow_drop_down_circle_rounded),
                                  isExpanded: true,
                                  items: datasnapshot.data!.docs
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
                              margin:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: TextFormField(
                                initialValue: quantity,
                                onChanged: (value) => quantity = value,
                                autofocus: false,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_rateFocusNode);
                                },
                                decoration: const InputDecoration(
                                  labelText: 'Quantity: ',
                                  labelStyle: TextStyle(fontSize: 20.0),
                                  border: OutlineInputBorder(),
                                  errorStyle: TextStyle(
                                      color: Colors.redAccent, fontSize: 15),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter quantity';
                                  }
                                  if (double.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          if (double.parse(value) <= 0) {
                            return 'Please enter a number greater than zero';
                          }
                                  return null;
                                },
                                focusNode: _quantityFocusNode,
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: TextFormField(
                                initialValue: rate,
                                onChanged: (value) => rate = value,
                                autofocus: false,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_amountFocusNode);
                                },
                                decoration: const InputDecoration(
                                  labelText: 'Rate: ',
                                  labelStyle: TextStyle(fontSize: 20.0),
                                  border: OutlineInputBorder(),
                                  errorStyle: TextStyle(
                                      color: Colors.redAccent, fontSize: 15),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter rate';
                                  }
                                  if (double.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          if (double.parse(value) <= 0) {
                            return 'Please enter a number greater than zero';
                          }
                                  return null;
                                },
                                focusNode: _rateFocusNode,
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: TextFormField(
                                initialValue: amount,
                                onChanged: (value) => amount = value,
                                autofocus: false,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_datetimeFocusNode);
                                },
                                decoration: const InputDecoration(
                                  labelText: 'Amount: ',
                                  labelStyle: TextStyle(fontSize: 20.0),
                                  border: OutlineInputBorder(),
                                  errorStyle: TextStyle(
                                      color: Colors.redAccent, fontSize: 15),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter amount';
                                  }
                                  if (double.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          if (double.parse(value) <= 0) {
                            return 'Please enter a number greater than zero';
                          }
                                  return null;
                                },
                                focusNode: _amountFocusNode,
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
                          padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          selectedDate!=null?Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}") :
                            Text('please select date'),
                            GestureDetector(
                                   onTap: (() => setState(() {
                                        _selectDate(context);
                                      })),
                                  child: Icon(Icons.date_range)),
                      ],),

                        ),
                    ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    // Validate returns true if the form is valid, otherwise false.
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        updateCompanysalesLead(
                                          widget.id,
                                          selfleadName,
                                          selfleadAddress,
                                          selfleadContact,
                                          selfleadcompanyName,
                                          _mySelection,
                                          quantity,
                                          rate,
                                          amount,
                                          datetime,
                                        );
                                      });
                                      Navigator.of(context).pop();
                                    }
                                  },
                                  child: const Text(
                                    'Save',
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ),
            );
          }),

    );
  }
}
