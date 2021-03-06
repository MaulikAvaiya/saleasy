import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';

import '../controller/user_controller.dart';

class AddTarget extends StatefulWidget {
  const AddTarget({
    Key? key,
  }) : super(key: key);
  static const routeName = '/add-target';

  @override
  _AddTargetState createState() => _AddTargetState();
}

class _AddTargetState extends State<AddTarget> {
  var product = '';
  var quantity = '';
  var _mySelection;
  var _mySelection1;

  final quantityController = TextEditingController();
  final productController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  DateTime selectedDate1 = DateTime.now();

  final Stream<QuerySnapshot> productStream = FirebaseFirestore.instance
      .collection('admin')
      .doc(userId)
      .collection('product')
      .snapshots();

  final Stream<QuerySnapshot> employeeStream = FirebaseFirestore.instance
      .collection('admin')
      .doc(userId)
      .collection('employee')
      .snapshots();

  CollectionReference target = FirebaseFirestore.instance
      .collection(user)
      .doc(userId)
      .collection('target');

  Future<void> addtarget1() {
    return target
        .add({
          'product': product,
          'datefrom': selectedDate,
          'dateto': selectedDate1,
          'quantity': quantity,
        })
        .then((value) => debugPrint('target Added'))
        .catchError((error) => debugPrint('Failed to Add target: $error'));
  }

  Future<void> addtarget() {
    return target
        .add({
          'employee': _mySelection,
          'product': _mySelection1,
          'datefrom': selectedDate,
          'dateto': selectedDate1,
          'quantity': quantity,
        })
        .then((value) => debugPrint('target Added'))
        .catchError((error) => debugPrint('Failed to Add target: $error'));
  }

  void _selectDateFrom(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
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

  void _selectDateTo(BuildContext context) async {
    final DateTime? selected1 = await showDatePicker(
      context: context,
      initialDate: selectedDate1,
      firstDate: DateTime(2010),
      lastDate: DateTime(2050),
    );
    if (selected1 != null && selected1 != selectedDate1) {
      setState(
        () {
          selectedDate1 = selected1;
        },
      );
    }
  }

  final _productFocusNode = FocusNode();
  final _contactnumberFocusNode = FocusNode();
  final _companynameFocusNode = FocusNode();
  final _datetimeFocusNode = FocusNode();
  final _taskdetailFocusNode = FocusNode();
  final _typeFocusNode = FocusNode();

  @override
  void dispose() {
    _productFocusNode.dispose();
    _contactnumberFocusNode.dispose();
    _companynameFocusNode.dispose();
    _datetimeFocusNode.dispose();
    _taskdetailFocusNode.dispose();
    _typeFocusNode.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.appbarColor,
        title: Text(
          "Add Target",
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
                child: StreamBuilder<QuerySnapshot>(
                    stream: productStream,
                    builder: (context, datasnapshot) {
                      if (datasnapshot.hasError) {
                        debugPrint('some thing went wrong');
                      }
                      if (datasnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 30),
                        child: ListView(
                          children: [
                            user != 'admin'
                                ? const SizedBox()
                                : Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                      color: Colors.grey,
                                      width: 0.8,
                                    )),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: DropdownButton<dynamic>(
                                        underline: Container(
                                            color: Colors.transparent),
                                        isDense: true,
                                        hint: _mySelection != null
                                            ? Text(_mySelection)
                                            : const Text(
                                                'select employee name'),
                                        value: _mySelection,
                                        onChanged: (dynamic newValue) {
                                          setState(() {
                                            _mySelection = newValue;
                                          });

                                          debugPrint(_mySelection);
                                        },
                                        icon: const Icon(Icons
                                            .arrow_drop_down_circle_rounded),
                                        isExpanded: true,
                                        items: snapshot.data!.docs.map(
                                          (DocumentSnapshot snapshot) {
                                            return DropdownMenuItem<dynamic>(
                                              value: snapshot[
                                                  'empname'], //snapshot['id'].toString(),
                                              child: Text(
                                                snapshot["empname"],
                                              ),
                                            );
                                          },
                                        ).toList(),
                                      ),
                                    ),
                                  ),
                            user != 'admin'
                                ? Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: TextFormField(
                                      autofocus: false,
                                      textInputAction: TextInputAction.next,
                                      onFieldSubmitted: (_) {
                                        FocusScope.of(context)
                                            .requestFocus(_productFocusNode);
                                      },
                                      decoration: const InputDecoration(
                                        labelText: 'Product Name: ',
                                        labelStyle: TextStyle(fontSize: 20.0),
                                        border: OutlineInputBorder(),
                                        errorStyle: TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 15),
                                      ),
                                      controller: productController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter Product name ';
                                        }
                                        return null;
                                      },
                                      focusNode: _productFocusNode,
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                      color: Colors.grey,
                                      width: 0.8,
                                    )),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: DropdownButton<dynamic>(
                                        underline: Container(
                                            color: Colors.transparent),
                                        isDense: true,
                                        hint: _mySelection1 != null
                                            ? Text(_mySelection1)
                                            : const Text('select product name'),
                                        value: _mySelection1,
                                        onChanged: (dynamic newValue) {
                                          setState(
                                            () {
                                              _mySelection1 = newValue;
                                            },
                                          );

                                          debugPrint(_mySelection1);
                                        },
                                        icon: const Icon(Icons
                                            .arrow_drop_down_circle_rounded),
                                        isExpanded: true,
                                        items: datasnapshot.data!.docs.map(
                                            (DocumentSnapshot datasnapshot) {
                                          return DropdownMenuItem<dynamic>(
                                            value: datasnapshot[
                                                'name'], //snapshot['id'].toString(),
                                            child: Text(
                                              datasnapshot["name"],
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                            // Container(
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(4),
                            //       border: Border.all(
                            //         color: Colors.grey,
                            //         width: 1,
                            //       )),
                            //   child: Padding(
                            //     padding: const EdgeInsets.symmetric(
                            //         vertical: 15, horizontal: 10),
                            //     child: DropdownButton<dynamic>(
                            //       underline:
                            //           Container(color: Colors.transparent),
                            //       isDense: true,
                            //       hint: _mySelection1 != null
                            //           ? Text(_mySelection1)
                            //           : const Text('select product name'),
                            //       value: _mySelection1,
                            //       onChanged: (dynamic newValue) {
                            //         setState(() {
                            //           _mySelection1 = newValue;
                            //         });

                            //         debugPrint(_mySelection1);
                            //       },
                            //       icon: const Icon(
                            //           Icons.arrow_drop_down_circle_rounded),
                            //       isExpanded: true,
                            // items: datasnapshot.data!.docs
                            //     .map((DocumentSnapshot datasnapshot) {
                            //   return DropdownMenuItem<dynamic>(
                            //     value: datasnapshot[
                            //         'name'], //snapshot['id'].toString(),
                            //     child: Text(
                            //       datasnapshot["name"],
                            //     ),
                            //   );
                            // }).toList(),
                            //     ),
                            //   ),
                            // ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    selectedDate != null
                                        ? Text(
                                            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}")
                                        : const Text('please select date from'),
                                    GestureDetector(
                                        onTap: (() => setState(() {
                                              _selectDateFrom(context);
                                            })),
                                        child: const Icon(Icons.date_range)),
                                  ],
                                ),
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    selectedDate1 != null
                                        ? Text(
                                            "${selectedDate1.day}/${selectedDate1.month}/${selectedDate1.year}")
                                        : const Text('please select date to'),
                                    GestureDetector(
                                        onTap: (() => setState(() {
                                              _selectDateTo(context);
                                            })),
                                        child: const Icon(Icons.date_range)),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: TextFormField(
                                autofocus: false,
                                keyboardType: TextInputType.datetime,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_typeFocusNode);
                                },
                                controller: quantityController,
                                decoration: const InputDecoration(
                                  labelText: 'quantity Detail: ',
                                  labelStyle: TextStyle(fontSize: 20.0),
                                  border: OutlineInputBorder(),
                                  errorStyle: TextStyle(
                                      color: Colors.redAccent, fontSize: 15),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter quantity detail';
                                  }
                                  return null;
                                },
                                focusNode: _taskdetailFocusNode,
                              ),
                            ),
                            SizedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                          quantity = quantityController.text;
                                        user!='admin'? addtarget1():addtarget();
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
                                ],
                              ),
                            ),
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
