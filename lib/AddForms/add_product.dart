import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';

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
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    rateController.dispose();

    // FocusNode.
      _rateFocusNode.dispose();

    super.dispose();
  }

  clearText() {
    nameController.clear();
    rateController.clear();
  }

  //  Adding Student
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  Future<void> addProduct() {
    return products
        .add({
          'name': productName,
          'rate': rate,
        })
        .then((value) => print('product Added'))
        .catchError((error) => print('Failed to Add product: $error'));
  }

  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode =FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add New Product",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: Form(
        
        key: _formKey,
        child: Padding(
          padding:const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                margin:const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context)
                        .requestFocus(_rateFocusNode);
                  },
                  decoration: InputDecoration(
                    labelText: 'ProductName: ',
                    labelStyle: TextStyle(fontSize: 20.0,color: ColorConfig.primaryColor,),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorConfig.primaryColor)),
                    enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: ColorConfig.backColor,width: 2)),
                    //border: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber,width: 10)),
                    errorStyle:
                        const TextStyle( color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Prouct Name';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin:const EdgeInsets.symmetric(vertical: 10.0),
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
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {clearText()},
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
