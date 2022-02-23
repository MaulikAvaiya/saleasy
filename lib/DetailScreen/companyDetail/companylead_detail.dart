import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/AddForms/company_lead_forms/add_company_sales_lead.dart';
import 'package:saleasy/AddForms/company_lead_forms/add_company_visited_lead.dart';
import 'package:saleasy/constant/color_config.dart';
class CompanyLeadDetail extends StatefulWidget {
  final String id;
  const CompanyLeadDetail({ Key? key ,required this.id}) : super(key: key);
  static const routeName='/companylead_detail';
  @override
  _CompanyLeadDetailState createState() => _CompanyLeadDetailState();
}

class _CompanyLeadDetailState extends State<CompanyLeadDetail> {

  CollectionReference companylead =
      FirebaseFirestore.instance.collection('companylead');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('companylead detail screen'),),
      body: FutureBuilder<DocumentSnapshot>(
          future: companylead.doc(widget.id).get(),
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
                  child: const Text('companylead detail screen'),
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
                                return AddCompanyVisitedLead(
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
                                return AddCompanySalesLead(
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
        ),
    );    
     
  }
}