import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';
import 'package:saleasy/deletefunction/companyleaddelete.dart';
import 'package:saleasy/screens/selflead/self_visited_screen.dart';
import '../../controller/user_controller.dart';

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

     var _mySelection;
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

   DateTime selectedDate = DateTime.now();

  CollectionReference companysaleslead =
  FirebaseFirestore.instance.collection(user).doc(userId).collection('companysaleslead');

  Future<void> addcompanysaleslead() {
    return companysaleslead
        .add({
          'name': widget.name,
          'address': widget.address,
          'contact': widget.contact,
          'companyname': widget.companyName,
          'product': _mySelection,
          'rate': rate,
          'amount': amount,
          'datetime': selectedDate,
          'quantity': quantity,
        })
        .then((value) => debugPrint('companysaleslead Added'))
        .catchError((error) => debugPrint('Failed to Add companysaleslead: $error'));
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

    final Stream<QuerySnapshot> productStream =
       FirebaseFirestore.instance.collection(user).doc(userId).collection('products').snapshots();


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.appbarColor,
        title: Text(
          "Add Company SalesLead",
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
                      if (value.length != 10){
                        return 'Contact number must be 10 digit';
                      }
                      return null;
                    },
                    focusNode: _contactnumberFocusNode,
                  ),
                ),
                Container(
                  margin:  const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    initialValue: widget.companyName,
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
                       if(double.tryParse(value) == null){
                        return 'Please enter a valid number';
                      }
                      if(double.parse(value) <= 0){
                        return 'Please enter a number greater than zero';
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
                       if(double.tryParse(value) == null){
                        return 'Please enter a valid number';
                      }
                      if(double.parse(value) <= 0){
                        return 'Please enter a number greater than zero';
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
                       if(double.tryParse(value) == null){
                        return 'Please enter a valid number';
                      }
                      if(double.parse(value) <= 0){
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
                            product = productController.text;
                            amount = amountController.text;
                            quantity = quantityController.text;
                            rate = rateController.text;
                            dateTime = dateTimeController.text;

                            addcompanysaleslead();
                            Companyleadelete().deletecompanylead(widget.id);
                            CompanyVisitedLeadDelete()
                                .deletevisitedlead(widget.id);
                            Navigator.of(context)
                                .popAndPushNamed(SelfVisitedScreen.routeName);
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
