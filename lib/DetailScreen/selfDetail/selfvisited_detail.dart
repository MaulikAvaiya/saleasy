import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/AddForms/self_lead_forms/add_sales_lead.dart';
import 'package:saleasy/constant/color_config.dart';

class SelfVisitedDetail extends StatefulWidget {
  final String id;
  const SelfVisitedDetail({Key? key, required this.id}) : super(key: key);
  static const routeName = '/SelfVisited_detail';
  @override
  _SelfVisitedDetailState createState() => _SelfVisitedDetailState();
}

class _SelfVisitedDetailState extends State<SelfVisitedDetail> {
  CollectionReference selflead =
      FirebaseFirestore.instance.collection('selfvisitedlead');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('self vidited detail screen'),
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
                  child: const Text('selfsaleslead detail screen'),
                ),
                Text(snapshot.data!['name']),
                Text(snapshot.data!['address']),
                Text(snapshot.data!['companyname']),
                Text(snapshot.data!['contact']),
                Text(snapshot.data!['product']),
                Text(snapshot.data!['decision']),
                Text(snapshot.data!['datetime']),
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
                                return AddSalesLead(
                                  id: widget.id,
                                  name: snapshot.data!['name'],
                                  address: snapshot.data!['address'],
                                  contact: snapshot.data!['contact'],
                                  companyName: snapshot.data!['companyname'],
                                );
                              },
                            ),
                          );
                        }),
                        child: Card(
                          color: ColorConfig.primaryColor,
                          child: Image.asset(''),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }
}
