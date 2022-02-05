import 'package:flutter/material.dart';
import 'product_screen.dart';
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

      
        backgroundColor: Theme.of(context).primaryColor,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('SalEasy',style: TextStyle(color:Colors.white,fontSize: 35),),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          height: 600,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            color: Colors.teal[100],
            child: Padding(
              padding:  EdgeInsets.only(top: 18),
              child: GridView.custom(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                          Card(
                            color: Colors.tealAccent[400],
                            elevation: 10,
                             child:
                            Image.asset(images[index], fit: BoxFit.cover,height: 80,width: 80,),
                          ),
                          Text(title[index]),
                        ],
                      ),
                  );
                     
                  },
                  childCount: 8,
                ),
                padding: EdgeInsets.all(10),
                shrinkWrap: true,

              ),
            ),
          ),
        ),

      )
    );
  }
}