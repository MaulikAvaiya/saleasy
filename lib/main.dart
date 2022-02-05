import 'package:flutter/material.dart';
import 'package:saleasy/auth/auth_screen.dart';
import 'package:saleasy/screens/Product_screen.dart';
import 'package:saleasy/screens/company_lead_screen.dart';
import 'package:saleasy/screens/company_task_screen.dart';
import 'package:saleasy/screens/employee_screen.dart';
import 'package:saleasy/screens/profile_screen.dart';
import 'package:saleasy/screens/self_lead_screen.dart';
import 'package:saleasy/screens/self_task_screen.dart';
import 'package:saleasy/screens/target_screen.dart';
import 'screens/home_screen.dart';
import 'package:saleasy/screens/lead_screen.dart';
import 'package:saleasy/screens/visited_lead_screen.dart';
import 'package:saleasy/screens/sales_lead_screen.dart';
import 'screens/sales_lead_screen.dart';
import './addscreens/add_product_screen.dart';
import './addscreens/add_employee_details_screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SalEasy',
      theme: ThemeData(
       primaryColor: Colors.tealAccent[400],
        
      ),
      home: HomeScreen(),
      routes: {
        ProductScreen.routeName:(context)=>ProductScreen(),
        EmployeeScreen.routeName:(context)=>EmployeeScreen(),
        SelfLeadScreen.routeName:(context)=>SelfLeadScreen(),
        CompanyLeadScreen.routeName:(context)=>CompanyLeadScreen(),
        SelfTaskScreen.routeName:(context)=>SelfTaskScreen(),
        CompanyTaskScreen.routeName:(context)=>CompanyTaskScreen(),
        TargetScreen.routeName:(context)=>TargetScreen(),
        ProfileScreen.routeName:(context)=>ProfileScreen(),
        LeadScreen.routeName:(context)=>LeadScreen(),
        VisitedLeadScreen.routeName:(context)=>VisitedLeadScreen(),
        SalesLeadScreen.routeName:(context)=>SalesLeadScreen(),
        AddProductScreen.routeName:(context)=>AddProductScreen(),
        AddEmployeeDetailScreen.routeName:(context)=>AddEmployeeDetailScreen(),
        

      },
    );
  }
}

