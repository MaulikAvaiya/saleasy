import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';
import 'package:saleasy/controller/user_controller.dart';
import '../DetailScreen/target_detail.dart';

class TargetList extends StatefulWidget {
  const TargetList({Key? key}) : super(key: key);

  @override
  _TargetListState createState() => _TargetListState();
}

class _TargetListState extends State<TargetList> {
  var datefrom;
  var dateto;

  final Stream<QuerySnapshot> targetStream = FirebaseFirestore.instance
      .collection(user)
      .doc(userId)
      .collection('target')
      .snapshots();

  CollectionReference target = FirebaseFirestore.instance
      .collection(user)
      .doc(userId)
      .collection('target');

  Future<void> deletetarget(id) {
    return target
        .doc(id)
        .delete()
        .then((value) => debugPrint('target deleted'))
        .catchError((error) => debugPrint('Fail: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: targetStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          debugPrint('some thing went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        double screenWitdth = MediaQuery.of(context).size.width;
        double screenHeight = MediaQuery.of(context).size.height;
        debugPrint(screenWitdth.toString());
        debugPrint(screenHeight.toString());
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            Timestamp timestamp = snapshot.data!.docs[index]['datefrom'];
            DateTime myDateTime = timestamp.toDate();

            Timestamp timestamp1 = snapshot.data!.docs[index]['dateto'];
            DateTime myDateTime1 = timestamp1.toDate();
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
                ),
              ),
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return TargetDetail(
                          mydatetime: myDateTime,
                          mydatetime1: myDateTime1,
                          productName: snapshot.data!.docs[index]['product'],
                          employeeName: snapshot.data!.docs[index]['employee'],
                          quantity: snapshot.data!.docs[index]['quantity'],
                        );
                      },
                    ),
                  );
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
                              "assets/images/target.png",
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
                                snapshot.data!.docs[index]['product'],
                                style:
                                    TextStyle(fontSize: screenHeight * 0.035),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: screenHeight * 0.012),
                                child: Text(
                                  "${myDateTime.day}/${myDateTime.month}/${myDateTime.year}",
                                  style:
                                      TextStyle(fontSize: screenHeight * 0.030),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: screenHeight * 0.012),
                                child: Text(
                                  "${myDateTime1.day}/${myDateTime1.month}/${myDateTime1.year}",
                                  style:
                                      TextStyle(fontSize: screenHeight * 0.030),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
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
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
