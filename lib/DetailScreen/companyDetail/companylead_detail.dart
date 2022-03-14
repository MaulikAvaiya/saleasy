import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/AddForms/company_lead_forms/add_company_sales_lead.dart';
import 'package:saleasy/AddForms/company_lead_forms/add_company_visited_lead.dart';
import 'package:saleasy/constant/color_config.dart';

class CompanyLeadDetail extends StatefulWidget {
  final String id;
  const CompanyLeadDetail({Key? key, required this.id}) : super(key: key);
  static const routeName = '/companylead_detail';
  @override
  _CompanyLeadDetailState createState() => _CompanyLeadDetailState();
}

class _CompanyLeadDetailState extends State<CompanyLeadDetail> {
  CollectionReference companylead =
      FirebaseFirestore.instance.collection('companylead');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.appbarColor,
        title: Text(
          'Company Lead Detail',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: ColorConfig.appbartextColor,
          ),
        ),
      ),
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
          return SingleChildScrollView(
            child: Container(
              color: ColorConfig.primaryColor,
              height: 700,
              width: 430,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 500,
                    width: 400,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Lead Name:",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              snapshot.data!['name'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: ColorConfig.textColor,
                              ),
                            ),
                            const Text(
                              "Address:",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              snapshot.data!['address'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: ColorConfig.textColor,
                              ),
                            ),
                            const Text(
                              "Company Name:",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              snapshot.data!['companyname'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: ColorConfig.textColor,
                              ),
                            ),
                            const Text(
                              "Contact Number:",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              snapshot.data!['contact'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: ColorConfig.textColor,
                              ),
                            ),
                            const Text(
                              "Employee Name:",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              snapshot.data!['employee'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: ColorConfig.textColor,
                              ),
                            ),
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
                                                address:
                                                    snapshot.data!['address'],
                                                contact:
                                                    snapshot.data!['contact'],
                                                companyName: snapshot
                                                    .data!['companyname']);
                                          },
                                        ),
                                      );
                                    }),
                                    child: Card(
                                  
                                      child: Image.asset(
                                          'assets/images/visitedlead.png'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: GestureDetector(
                                    onTap: () => setState(() {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return AddCompanySalesLead(
                                                id: widget.id,
                                                name: snapshot.data!['name'],
                                                address:
                                                    snapshot.data!['address'],
                                                contact:
                                                    snapshot.data!['contact'],
                                                companyName: snapshot
                                                    .data!['companyname']);
                                          },
                                        ),
                                      );
                                    }),
                                    child: Card(
                                      
                                      child: Image.asset(
                                          'assets/images/saleslead.png'),
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
                                //      
                                //       child: Image.asset(''),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
