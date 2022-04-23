import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';
import 'package:saleasy/controller/user_controller.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);
  static const routeName = '/add-Product';

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _rateFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  var productName = "";
  var rate = "";

  // Create a text controller and use it to retrieve the current value
  final nameController = TextEditingController();
  final rateController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed
    nameController.dispose();
    rateController.dispose();

    // FocusNode
    _rateFocusNode.dispose();

    super.dispose();
  }

  clearText() {
    nameController.clear();
    rateController.clear();
  }

  //  Adding Student
  CollectionReference products = FirebaseFirestore.instance
      .collection('admin')
      .doc(userId)
      .collection('product');

  Future<void> addProduct() {
    return products
        .add({
          'name': productName,
          'rate': rate,
        })
        .then((value) => debugPrint('product Added'))
        .catchError((error) => debugPrint('Failed to Add product: $error'));
  }

  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = FocusNode();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.appbarColor,
        title: Text(
          "Add New Product",
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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_rateFocusNode);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Product name: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a product name';
                      }

                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
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
                              productName = nameController.text;
                              rate = rateController.text;
                              addProduct();

                              Navigator.pop(context);
                              // addUser();
                            });
                          }
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => {clearText()},
                        child: const Text(
                          'Reset',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
      ),
    );
  }
}

class Parse {}
