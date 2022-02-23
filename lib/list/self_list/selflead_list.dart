import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/DetailScreen/selfDetail/selflead_detail.dart';
import 'package:saleasy/EditForms/Self_lead_EditForm/edit_self_lead.dart';
import 'package:saleasy/constant/color_config.dart';
import 'package:saleasy/deletefunction/selfleadelete.dart';

class SelfLeadList extends StatefulWidget {
  const SelfLeadList({Key? key}) : super(key: key);

  @override
  _SelfLeadListState createState() => _SelfLeadListState();
}

class _SelfLeadListState extends State<SelfLeadList> {
  final Stream<QuerySnapshot> selfleadStream =
      FirebaseFirestore.instance.collection('selflead').snapshots();

  CollectionReference selflead =
      FirebaseFirestore.instance.collection('selflead');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: selfleadStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('some thing went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
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
                          onPressed: () {
                            setState(() {
                              Selfleadelete().deleteSelflead(
                                  snapshot.data!.docs[index].id);
                              Navigator.of(ctx).pop(true);
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
                key: ValueKey(null),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return SelfLeadDetail(id: snapshot.data!.docs[index].id);
                    },
                  )),
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
                                  snapshot.data!.docs[index]['name'],
                                  style: TextStyle(fontSize: 20),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    snapshot.data!.docs[index]['contact'],
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    snapshot.data!.docs[index]['companyname'],
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return EditSelfLead(
                                    id: snapshot.data!.docs[index].id);
                              },
                            )),
                            child: Card(
                              elevation: 10,
                              color: ColorConfig.backColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Padding(
                                padding: EdgeInsets.all(10),
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
