import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/AddForms/company_lead_forms/add_company_sales_lead.dart';
import 'package:saleasy/constant/color_config.dart';

class CompanyVisitedDetail extends StatefulWidget {
  final String id;
  const CompanyVisitedDetail({Key? key, required this.id}) : super(key: key);
  static const routeName = '/CompanyVisited_detail';
  @override
  _CompanyVisitedDetailState createState() => _CompanyVisitedDetailState();
}

class _CompanyVisitedDetailState extends State<CompanyVisitedDetail> {
  CollectionReference companyvisitedlead =
      FirebaseFirestore.instance.collection('companyvisitedlead');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.appbarColor,
        title: Text(
          'Company Visited Detail',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: ColorConfig.appbartextColor,
          ),
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: companyvisitedlead.doc(widget.id).get(),
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
                              "Product Name:",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              snapshot.data!['product'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: ColorConfig.textColor,
                              ),
                            ),
                            const Text(
                              "Decision:",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              snapshot.data!['decision'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: ColorConfig.textColor,
                              ),
                            ),
                            const Text(
                              "date Time:",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              snapshot.data!['datetime'],
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
                                            return AddCompanySalesLead(
                                              id: widget.id,
                                              name: snapshot.data!['name'],
                                              address:
                                                  snapshot.data!['address'],
                                              contact:
                                                  snapshot.data!['contact'],
                                              companyName:
                                                  snapshot.data!['companyname'],
                                            );
                                          },
                                        ),
                                      );
                                    }),
                                    child: Card(
                                      
                                      child: Image.asset('assets/images/sales-lead.png'),
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
            ),
          );
        },
      ),
    );
  }
}
