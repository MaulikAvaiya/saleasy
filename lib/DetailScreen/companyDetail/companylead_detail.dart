import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/AddForms/company_lead_forms/add_company_sales_lead.dart';
import 'package:saleasy/AddForms/company_lead_forms/add_company_visited_lead.dart';
import 'package:saleasy/constant/color_config.dart';
import 'package:flutter_sms/flutter_sms.dart';
import '../../AddForms/company_lead_forms/add_company_task.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/user_controller.dart';

class CompanyLeadDetail extends StatefulWidget {
  final String id;
  const CompanyLeadDetail({Key? key, required this.id}) : super(key: key);
  static const routeName = '/companylead_detail';
  @override
  _CompanyLeadDetailState createState() => _CompanyLeadDetailState();
}

class _CompanyLeadDetailState extends State<CompanyLeadDetail> {
  CollectionReference companylead =
      FirebaseFirestore.instance.collection(user)
      .doc(userId).collection('companylead');

  String number = '';
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
            debugPrint('some thing went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          number = snapshot.data!['contact'];
          List<String> recipents = [number];
          String code = '91';
          return SingleChildScrollView(
            child: Container(
              color: ColorConfig.primaryColor,
              height: 700,
              width: 430,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 600,
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
                            Container(
                               padding: const EdgeInsets.all(25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 90,
                                    height: 90,
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
                                            'assets/images/visited-lead.png'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 90,
                                    height: 90,
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
                                            'assets/images/sales-lead.png'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 90,
                                    height: 90,
                                    child: GestureDetector(
                                      onTap: () => setState(() {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return AddCompanyTask(
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
                                        child:
                                            Image.asset('assets/images/task.png'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 90,
                                    height: 90,
                                    child: GestureDetector(
                                      onTap: () async {
                                        await launch(
                                          'https://wa.me/$code$number',
                                        );
                                      },
                                      child: Card(
                                        child: Image.asset(
                                            'assets/images/whatsapp.png',),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 90,
                                    height: 90,
                                    child: GestureDetector(
                                      onTap: () {
                                        _sendsms('welcome', recipents);
                                      },
                                      child: Card(
                                        child: Image.asset(
                                          'assets/images/message.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 90,
                                    height: 90,
                                    child: GestureDetector(
                                      onTap: () async {
                                        await launch('tel://$number');
                                      },
                                      child: Card(
                                        child:
                                            Image.asset('assets/images/phone.png',),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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


void _sendsms(String sms, List<String> recipents) async {
  String _result =
      await sendSMS(message: sms, recipients: recipents).catchError((onError) {
    debugPrint(onError);
  });
  debugPrint(_result);
}

