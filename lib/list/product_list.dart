import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/DetailScreen/product_detail.dart';
import 'package:saleasy/EditForms/edit_product.dart';
import 'package:saleasy/constant/color_config.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final Stream<QuerySnapshot> productStream =
      FirebaseFirestore.instance.collection('products').snapshots();

  CollectionReference product =
      FirebaseFirestore.instance.collection('products');

  Future<void> deleteProduct(id) {
    return product
        .doc(id)
        .delete()
        .then((value) => print('user deleted'))
        .catchError((error) => print('Fail: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: productStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('some thing went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final List storeDocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map product = document.data() as Map<String, dynamic>;
            storeDocs.add(product);
          }).toList();
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return Dismissible(
                background: Container(
                  color: Theme.of(context).errorColor,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 40,
                  ),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20),
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 4,
                  ),
                ),
                direction: DismissDirection.endToStart,
                confirmDismiss: (direction) {
                  return showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text('Are you sure?'),
                      content: Text(
                        'Do you want to remove the item from the cart?',
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('No'),
                          onPressed: () {
                            Navigator.of(ctx).pop(false);
                          },
                        ),
                        FlatButton(
                          child: Text('Yes'),
                          onPressed: () => {
                            deleteProduct(snapshot.data!.docs[index].id),
                            Navigator.of(context).pop(),
                          },
                        ),
                      ],
                    ),
                  );
                },
                key: ValueKey(null),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return  ProductDetail(name: snapshot.data!.docs[index]['name'],rate:snapshot.data!.docs[index]['rate'].toString() ,);
                    }));
                  },
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 7, right: 15),
                            child: Card(
                              elevation: 5,
                              color: ColorConfig.primaryColor,
                              child: Image.asset(
                                "assets/images/product.png",
                                width: 60,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 230,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${snapshot.data!.docs[index]['name']}',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    '${snapshot.data!.docs[index]['rate']}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Card(
                            elevation: 10,
                            color: ColorConfig.backColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditProduct(
                                          id: snapshot.data!.docs[index].id),
                                    ),
                                  ),
                                },
                                child: Icon(
                                  Icons.edit,
                                  color: ColorConfig.primaryColor,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
