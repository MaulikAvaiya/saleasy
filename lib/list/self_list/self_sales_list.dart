import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/EditForms/Self_lead_EditForm/edit_sales_lead.dart';
import 'package:saleasy/constant/color_config.dart';

import '../../DetailScreen/selfDetail/selfsales_detail.dart';
import '../../controller/user_controller.dart';

class SelfSalesList extends StatefulWidget {
  const SelfSalesList({Key? key}) : super(key: key);

  @override
  _SelfSalesListState createState() => _SelfSalesListState();
}

class _SelfSalesListState extends State<SelfSalesList> {
  final Stream<QuerySnapshot> selfsalesleadStream =
      FirebaseFirestore.instance.collection(user).doc(userId).collection('selfsaleslead').snapshots();

  CollectionReference selfsaleslead =
      FirebaseFirestore.instance.collection(user).doc(userId).collection('selfsaleslead');

  @override
  Widget build(BuildContext context) {
    double screenWitdth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    debugPrint(screenWitdth.toString());
    debugPrint(screenHeight.toString());
    return StreamBuilder<QuerySnapshot>(
        stream: selfsalesleadStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            debugPrint('some thing went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
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
                      size: screenHeight * 0.05,
                    ),
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: screenWitdth * 0.05),
                    margin: EdgeInsets.symmetric(
                      horizontal: screenWitdth * 0.019,
                      vertical: screenHeight * 0.025,
                    ),),
                direction: DismissDirection.endToStart,
                confirmDismiss: (direction) {
                  return showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Are you sure?'),
                      content: const Text(
                        'Do you want to remove the item from the cart?',
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: const Text('No'),
                          onPressed: () {
                            Navigator.of(ctx).pop(false);
                          },
                        ),
                        FlatButton(
                          child: const Text('Yes'),
                          onPressed: () {
                            Navigator.of(ctx).pop(true);
                          },
                        ),
                      ],
                    ),
                  );
                },
                key: const ValueKey(null),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return SelfSalesDetail(
                            id: snapshot.data!.docs[index].id);
                      },
                    ));
                  },
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWitdth * 0.025,
                        vertical: screenHeight * 0.025,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: screenWitdth * 0.02,
                              right: screenWitdth * 0.04,
                            ),
                            child: Card(
                              elevation: 5,
                              color: ColorConfig.primaryColor,
                              child: Image.asset(
                                "assets/images/sales-lead.png",
                                width: 60,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenWitdth * 0.52,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.docs[index]['name'],
                                  style:  TextStyle(fontSize: screenHeight * 0.035),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: screenHeight * 0.012),
                                  child: Text(
                                    snapshot.data!.docs[index]['contact'],
                                    style:  TextStyle(fontSize: screenHeight * 0.030),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top:screenHeight * 0.012),
                                  child: Text(
                                    snapshot.data!.docs[index]['rate']
                                        .toString(),
                                    style: TextStyle(fontSize: screenHeight * 0.030),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return EditSalesLead(
                                      id: snapshot.data!.docs[index].id);
                                },
                              ),
                            ),
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                horizontal: screenWitdth * 0.008,
                                vertical: screenHeight * 0.006,
                              ),
                                child: Icon(
                                  Icons.edit,
                                  color: ColorConfig.appbarColor,
                                  size: screenHeight * 0.05,
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
