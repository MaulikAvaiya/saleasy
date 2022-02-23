import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class EditProduct extends StatefulWidget {
  static const routeName = '/Edit_product';
  final String id;


  EditProduct({Key? key, required this.id}) : super(key: key);

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _formKey = GlobalKey<FormState>();

  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  Future<void> updateProduct(id, name, rate) {
    return products
        .doc(id)
        .update({
          'name': name,
          'rate': rate,
        })
        .then((value) => print("User Updated"))
        .catchError(
          (error) => print("Failed to update user:$error"),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Products'),
      ),
      body: Form(
        key: _formKey,
        child: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection('products')
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
            var name = data['name'];
            var rate = data['rate'];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      initialValue: name,
                      onChanged: (value) => name = value,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'ProductName: ',
                        labelStyle: TextStyle(fontSize: 20.0),
                        border: OutlineInputBorder(),
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Prouct Name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      initialValue: rate,
                      onChanged: (value) => rate = value,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Rate: ',
                        labelStyle: TextStyle(fontSize: 20.0),
                        border: OutlineInputBorder(),
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter rate';
                        }
                        return null;
                      },
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
                              updateProduct(widget.id, name, rate);
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            'update',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => {},
                          child: Text(
                            'Reset',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blueGrey),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
