import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';
import 'package:saleasy/deletefunction/companyleaddelete.dart';
import 'package:saleasy/screens/selflead/self_visited_screen.dart';

class AddCompanySalesLead extends StatefulWidget {
  final String id;
  final String name;
  final String address;
  final String contact;
  final String companyName;
  //final String product;

  const AddCompanySalesLead({
    Key? key,
    required this.id,
    required this.name,
    required this.address,
    required this.contact,
    required this.companyName,
   // required this.product,
  }) : super(key: key);
  static const routeName = '/add-Companysales-lead';

  @override
  _AddCompanySalesLeadState createState() => _AddCompanySalesLeadState();
}

class _AddCompanySalesLeadState extends State<AddCompanySalesLead> {
  var leadName = '';
  var leadAddress = '';
  var leadContact = '';
  var leadCompanyName = '';
  var dateTime = '';
  var rate = '';
  var amount = '';
  var product = '';
  var quantity = '';

  final leadNameController = TextEditingController();
  final leadAddressController = TextEditingController();
  final leadContactController = TextEditingController();
  final leadCompanyNameController = TextEditingController();
  final leadEmpNameController = TextEditingController();
  final dateTimeController = TextEditingController();
  final productController = TextEditingController();
  final rateController = TextEditingController();
  final amountController = TextEditingController();
  final quantityController = TextEditingController();

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

  CollectionReference companysaleslead =
      FirebaseFirestore.instance.collection('companysaleslead');

  Future<void> addcompanysaleslead() {
    return companysaleslead
        .add({
          'name': widget.name,
          'address': widget.address,
          'contact': widget.contact,
          'companyname': widget.companyName,
          'product': product,
          'rate': rate,
          'amount': amount,
          'datetime': dateTime,
          'quantity': quantity,
        })
        .then((value) => print('companysaleslead Added'))
        .catchError((error) => print('Failed to Add companysaleslead: $error'));
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.primaryColor,
        title: const Text(
          "Add companysales Lead",
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
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  initialValue: widget.companyName,
                  autofocus: false,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_productnameFocusNode);
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
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_quantityFocusNode);
                  },
                  decoration: const InputDecoration(
                    labelText: 'product Name: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: productController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter product number';
                    }
                    return null;
                  },
                  focusNode: _productnameFocusNode,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_rateFocusNode);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Quantity: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: quantityController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter quantity';
                    }
                    return null;
                  },
                  focusNode: _quantityFocusNode,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_amountFocusNode);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Rate: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: rateController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Rate';
                    }
                    return null;
                  },
                  focusNode: _rateFocusNode,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_datetimeFocusNode);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Amount: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: amountController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter amount';
                    }
                    return null;
                  },
                  focusNode: _amountFocusNode,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    labelText: 'Date Time: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: dateTimeController,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            product=productController.text;
                            amount = amountController.text;
                            quantity = quantityController.text;
                            rate = rateController.text;
                            dateTime = dateTimeController.text;

                            addcompanysaleslead();
                            Companyleadelete().deletecompanylead(widget.id);
                            CompanyVisitedLeadDelete().deletevisitedlead(widget.id);
                            Navigator.of(context).popAndPushNamed(SelfVisitedScreen.routeName);
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
              )
            ],
          ),
        ),
      ),
    );
  }
}