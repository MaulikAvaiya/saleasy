import 'package:flutter/material.dart';
import 'package:saleasy/widgets/main_drawer.dart';
import 'Product_screen.dart';
import 'company_lead_screen.dart';
import 'company_task_screen.dart';
import 'employee_screen.dart';
import 'profile_screen.dart';
import 'self_lead_screen.dart';
import 'self_task_screen.dart';
import 'target_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = [
   "assets/images/ecommerce.png",
   "assets/images/customer.png",
   "assets/images/dairy-products.png",
   "assets/images/employee.png",
   "assets/images/goal.png",
   "assets/images/meeting.png",
   "assets/images/teamwork.png",
   "assets/images/user.png",
 ];

 List<String> title=[
   'Product',
   'employee',
   'self lead',
   'company lead',
   'self task',
   'company task',
   'target',
   'profile',
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SelEasy"),
      ),
      drawer: MainDrawer(),
      body: GridView.custom(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 25,
          mainAxisSpacing: 25,
        ),
        childrenDelegate: SliverChildBuilderDelegate((BuildContext, index){
          return GestureDetector(
            onTap: () {
              switch(index){
                case 0: Navigator.pushNamed(context,ProductScreen.routeName);
                break;
                case 1: Navigator.pushNamed(context, EmployeeScreen.routeName);
                break;
                case 2: Navigator.pushNamed(context,SelfLeadScreen.routeName);
                break;
                case 3: Navigator.pushNamed(context, CompanyLeadScreen.routeName);
                break;
                case 4: Navigator.pushNamed(context,SelfTaskScreen.routeName);
                break;
                case 5: Navigator.pushNamed(context, CompanyTaskScreen.routeName);
                break;
                case 6: Navigator.pushNamed(context,TargetScreen.routeName);
                break;
                case 7: Navigator.pushNamed(context, ProfileScreen.routeName);
                break;
              }
            },
            child: Column(
                children: [
                  Card( child:
                    Image.asset(images[index], fit: BoxFit.fitHeight,height: 90,width: 90,),
                    elevation: 5,
                    shadowColor: Colors.black12,
                  ),
                  
                  Text(title[index]),
                ],
              ),
          );
             
          },
          childCount: 8,
        ),
        padding: EdgeInsets.all(20),
        shrinkWrap: true,
      )
    );
  }
}