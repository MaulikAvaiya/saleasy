import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/AddForms/company_lead_forms/add_company_sales_lead.dart';
import 'package:saleasy/AddForms/company_lead_forms/add_company_visited_lead.dart';
import 'package:saleasy/constant/color_config.dart';

import '../../AddForms/company_lead_forms/add_company_task.dart';

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
      backgroundColor: ColorConfig.appbarColor,
      appBar: AppBar(
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
          return Container(
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
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
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
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
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
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
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
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
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
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
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
                                    color: ColorConfig.primaryColor,
                                    child: Image.asset(''),
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
                                    color: ColorConfig.primaryColor,
                                    child: Image.asset(''),
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
                                                  return AddCompanyTask(
                                                      id: widget.id,
                                                      name: snapshot
                                                          .data!['name'],
                                                      address: snapshot
                                                          .data!['address'],
                                                      contact: snapshot
                                                          .data!['contact'],
                                                      companyName:
                                                          snapshot.data![
                                                              'companyname']);
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
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
