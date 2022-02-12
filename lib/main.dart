import 'package:flutter/material.dart';
import 'package:saleasy/AddForms/add_product.dart';
import 'package:saleasy/DetailScreen/companyDetail/companylead_detail.dart';
import 'package:saleasy/DetailScreen/companyDetail/companysales_detail.dart';
import 'package:saleasy/DetailScreen/companyDetail/companyvisited_detail.dart';
import 'package:saleasy/DetailScreen/companytask_detail.dart';
import 'package:saleasy/DetailScreen/employee_detail.dart';

import 'package:saleasy/DetailScreen/selfDetail/selflead_detail.dart';
import 'package:saleasy/DetailScreen/selfDetail/selfsales_detail.dart';
import 'package:saleasy/DetailScreen/selfDetail/selfvisited_detail.dart';
import 'package:saleasy/DetailScreen/selftask_detail.dart';
import 'package:saleasy/DetailScreen/target_detail.dart';


import 'package:saleasy/auth/auth_screen.dart';
import 'package:saleasy/screens/CompanyLead/company_sales_screen.dart';
import 'package:saleasy/screens/CompanyLead/company_visited_screen.dart';
import 'package:saleasy/screens/CompanyLead/companylead_screen.dart';
import 'package:saleasy/screens/product_screen.dart';
import 'package:saleasy/screens/company_lead.dart';
import 'package:saleasy/screens/company_task_screen.dart';
import 'package:saleasy/screens/employee_screen.dart';
import 'package:saleasy/screens/profile_screen.dart';
import 'package:saleasy/screens/self_lead.dart';
import 'package:saleasy/screens/self_task_screen.dart';
import 'package:saleasy/screens/target_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/home_screen.dart';
import 'package:saleasy/screens/selflead/selflead_screen.dart';
import 'package:saleasy/screens/selflead/self_sales_screen.dart';
import 'package:saleasy/screens/selflead/self_visited_screen.dart';
import 'screens/selflead/self_visited_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SalEasy App',
      theme: ThemeData(
        primaryColor: Colors.tealAccent[400],
      ),
      home: HomeScreen(),
      routes: {
        //main route
        ProductScreen.routeName: (context) => ProductScreen(),
        EmployeeScreen.routeName: (context) => EmployeeScreen(),
        SelfLead.routeName: (context) => SelfLead(),
        CompanyLead.routeName: (context) => CompanyLead(),
        SelfTaskScreen.routeName: (context) => SelfTaskScreen(),
        CompanyTaskScreen.routeName: (context) => CompanyTaskScreen(),
        TargetScreen.routeName: (context) => TargetScreen(),
        ProfileScreen.routeName: (context) => ProfileScreen(),

        //Addform route
        AddProduct.routeName: (context) => AddProduct(),
      

        //EditForm route
        

        //self lead route
        SelfLeadScreen.routeName: (context) => SelfLeadScreen(),
        SelfVisitedScreen.routeName: (context) => SelfVisitedScreen(),
        SelfSalesScreen.routeName: (context) => SelfSalesScreen(),
        //company lead route
        CompanyLeadScreen.routeName: (context) => CompanyLeadScreen(),
        CompanyVisitedScreen.routeName: (context) => CompanyVisitedScreen(),
        CompanySalesScreen.routeName: (context) => CompanySalesScreen(),

        //detail route
       // ProductDetail.routeName: (context) => ProductDetail(name: '',rate: '',),
        EmloyeeDetail.routeName: (context) => EmloyeeDetail(),
        SelfLeadDetail.routeName: (context) => SelfLeadDetail(),
        SelfVisitedDetail.routeName: (context) => SelfVisitedDetail(),
        SelfSalesDetail.routeName: (context) => SelfSalesDetail(),
        CompanyLeadDetail.routeName: (context) => CompanyLeadDetail(),
        CompanyVisitedDetail.routeName: (context) => CompanyVisitedDetail(),
        CompanySalesDetail.routeName: (context) => CompanySalesDetail(),
        SelfTaskDetail.routeName:(context)=>SelfTaskDetail(),
        CompanyTaskDetail.routeName:(context)=>CompanyTaskDetail(),
        TargetDetail.routeName:(context)=>TargetDetail(),
      },
    );
  }
}
