import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/AddForms/self_lead_forms/add_sales_lead.dart';
import 'package:saleasy/AddForms/self_lead_forms/add_visited_lead.dart';
import 'package:saleasy/constant/color_config.dart';

class SelfLeadDetail extends StatefulWidget {
  final String id;
  const SelfLeadDetail({Key? key, required this.id}) : super(key: key);
  static const routeName = '/Selflead_detail';
  @override
  _SelfLeadDetailState createState() => _SelfLeadDetailState();
}

class _SelfLeadDetailState extends State<SelfLeadDetail> {
  CollectionReference selflead =
      FirebaseFirestore.instance.collection('selflead');

  //  Future<void> getData(String id) {
  //   return selflead
  //       .doc(widget.id)
  //       .get()
  //       .then((value) => print('data get successfully.'))
  //       .catchError((error) => print('failed to getdata:$error'));
  // }

  @override
  Widget build(BuildContext context) {
    // var data = getData(widget.id);
    return Scaffold(
        appBar: AppBar(
          title: const Text('selflead detail screen'),
        ),
        body: FutureBuilder<DocumentSnapshot>(
          future: selflead.doc(widget.id).get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('some thing went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                Container(
                  child: const Text('selflead detail screen'),
                ),
                Text(snapshot.data!['name']),
                Text(snapshot.data!['address']),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: GestureDetector(
                        onTap: () => setState(() {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return AddVisitedLead(
                                    id: widget.id,
                                    name: snapshot.data!['name'],
                                    address: snapshot.data!['address'],
                                    contact: snapshot.data!['contact'],
                                    companyName: snapshot.data!['companyname']);
                              },
                            ),
                          );
                          }
                          ),
                        child: Card(
                          color: ColorConfig.primaryColor,
                          child: Image.asset(''),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: 
                      GestureDetector(
                        onTap: () => setState(() {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return AddSalesLead(
                                    id: widget.id,
                                    name: snapshot.data!['name'],
                                    address: snapshot.data!['address'],
                                    contact: snapshot.data!['contact'],
                                    companyName: snapshot.data!['companyname']);
                              },
                            ),
                          );
                          }
                          ),
                        child: Card(
                          color: ColorConfig.primaryColor,
                          child: Image.asset(''),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: 100,
                    //   height: 100,
                    //   child: GestureDetector(
                    //     onTap: () => setState(() {
                    //       Navigator.of(context).push(
                    //         MaterialPageRoute(
                    //           builder: (context) {
                    //             return AddVisitedLead(
                    //                 id: widget.id,
                    //                 name: snapshot.data!['name'],
                    //                 address: snapshot.data!['address'],
                    //                 contact: snapshot.data!['contact'],
                    //                 companyName: snapshot.data!['companyname']);
                    //           },
                    //         ),
                    //       );
                    //       }
                    //       ),
                    //     child: Card(
                    //       color: ColorConfig.primaryColor,
                    //       child: Image.asset(''),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            );
          },
        ));
  }
}
