import 'package:flutter/material.dart';
import 'package:saleasy/AddForms/add_product.dart';
import 'package:saleasy/AddForms/company_lead_forms/add_company_lead.dart';
import 'package:saleasy/AddForms/self_lead_forms/add_self_lead.dart';
import 'package:saleasy/AddForms/target_form.dart';
import 'package:saleasy/AddForms/add_employee.dart';
import 'package:saleasy/auth/change_password.dart';
import 'package:saleasy/auth/forgot_password.dart';
import 'package:saleasy/auth/login.dart';
import 'package:saleasy/auth/signup.dart';
import 'package:saleasy/screens/CompanyLead/company_sales_screen.dart';
import 'package:saleasy/screens/CompanyLead/company_visited_screen.dart';
import 'package:saleasy/screens/CompanyLead/companylead_screen.dart';
import 'package:saleasy/screens/home_screen.dart';
import 'package:saleasy/screens/product_screen.dart';
import 'package:saleasy/screens/company_lead.dart';
import 'package:saleasy/screens/company_task_screen.dart';
import 'package:saleasy/screens/employee_screen.dart';
import 'package:saleasy/screens/self_lead.dart';
import 'package:saleasy/screens/self_task_screen.dart';
import 'package:saleasy/screens/target_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:saleasy/screens/selflead/selflead_screen.dart';
import 'package:saleasy/screens/selflead/self_sales_screen.dart';
import 'package:saleasy/screens/selflead/self_visited_screen.dart';
import 'package:saleasy/screens/user_page.dart';
import 'auth/profile_screen.dart';
import 'screens/selflead/self_visited_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SalEasy App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.tealAccent[400],
      ),
      home: const UserPage(),
      routes: {
        //main route
        ProductScreen.routeName: (context) => const ProductScreen(),
        EmployeeScreen.routeName: (context) => const EmployeeScreen(),
        SelfLead.routeName: (context) => SelfLead(),
        CompanyLead.routeName: (context) => const CompanyLead(),
        SelfTaskScreen.routeName: (context) => const SelfTaskScreen(),
        CompanyTaskScreen.routeName: (context) => const CompanyTaskScreen(),
        TargetScreen.routeName: (context) => const TargetScreen(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        ChangePassword.routeName:(context)=>const ChangePassword(),

        //Addform route
        AddProduct.routeName: (context) => const AddProduct(),
        AddEmployee.routeName: (context) => const AddEmployee(),
        AddSelfLead.routeName:(context)=>const AddSelfLead(),
        AddCompanyLead.routeName:(context)=>const AddCompanyLead(),

      

        //EditForm route

        

        //self lead route
        SelfLeadScreen.routeName: (context) => const SelfLeadScreen(),
        SelfVisitedScreen.routeName: (context) => const SelfVisitedScreen(),
        SelfSalesScreen.routeName: (context) => const SelfSalesScreen(),
        //company lead route
        CompanyLeadScreen.routeName: (context) => const CompanyLeadScreen(),
        CompanyVisitedScreen.routeName: (context) => const CompanyVisitedScreen(),
        CompanySalesScreen.routeName: (context) => const CompanySalesScreen(),
         AddTarget.routeName: (context) =>  const AddTarget(),
        Signup.routeName:(context)=>const Signup(),
        //detail route
       // ProductDetail.routeName: (context) => ProductDetail(name: '',rate: '',),
        //EmloyeeDetail.routeName: (context) => const EmloyeeDetail(),
      //  SelfLeadDetail.routeName: (context) => SelfLeadDetail(),
      //  SelfVisitedDetail.routeName: (context) => SelfVisitedDetail(),
        //SelfSalesDetail.routeName: (context) => SelfSalesDetail(),
      //  CompanyLeadDetail.routeName: (context) => CompanyLeadDetail(),
      //  CompanyVisitedDetail.routeName: (context) => CompanyVisitedDetail(),
       // CompanySalesDetail.routeName: (context) =>  CompanySalesDetail(),
        //SelfTaskDetail.routeName:(context)=>const SelfTaskDetail(),
       // CompanyTaskDetail.routeName:(context)=>const CompanyTaskDetail(),
        //TargetDetail.routeName:(context)=>const TargetDetail(),
      },
    );
  }
}
