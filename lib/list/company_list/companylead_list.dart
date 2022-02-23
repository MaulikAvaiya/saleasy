import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/DetailScreen/companyDetail/companylead_detail.dart';
import 'package:saleasy/EditForms/Company_lead_EditForm/edit_company_lead.dart';
import 'package:saleasy/constant/color_config.dart';

class CompanyLeadList extends StatefulWidget {
  const CompanyLeadList({Key? key}) : super(key: key);

  @override
  _CompanyLeadListState createState() => _CompanyLeadListState();
}

class _CompanyLeadListState extends State<CompanyLeadList> {
  final Stream<QuerySnapshot> companyleadStream =
      FirebaseFirestore.instance.collection('companylead').snapshots();

  CollectionReference companylead =
      FirebaseFirestore.instance.collection('companylead');

  @override
  Widget build(BuildContext context) {
    return
    
     StreamBuilder<QuerySnapshot>(
        stream: companyleadStream,
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
                            Navigator.of(ctx).pop(true);
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
                      return CompanyLeadDetail(id: snapshot.data!.docs[index].id);
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
                            onTap: () => Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return EditCompanyLead(
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
