import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';

class TargetList extends StatefulWidget {
  const TargetList({ Key? key }) : super(key: key);

  @override
  _TargetListState createState() => _TargetListState();
}

class _TargetListState extends State<TargetList> {
  @override
  Widget build(BuildContext context) {
     double screenWitdth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    debugPrint(screenWitdth.toString());
    debugPrint(screenHeight.toString());
    return ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Dismissible(
                background: Container(
                  color: Theme.of(context).errorColor,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: screenHeight * 0.05,
                  ),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: screenWitdth * 0.05),
                  margin: EdgeInsets.symmetric(
                   horizontal: screenWitdth * 0.019,
                  vertical: screenHeight * 0.025,
                  ),
                ),
                direction: DismissDirection.endToStart,
                confirmDismiss: (direction) {
                  return showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Are you sure?'),
                      content: const Text(
                        'Do you want to remove the item from the cart?',
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: const Text('No'),
                          onPressed: () {
                            Navigator.of(ctx).pop(false);
                          },
                        ),
                        FlatButton(
                          child: const Text('Yes'),
                          onPressed: () {
                            Navigator.of(ctx).pop(true);
                          },
                        ),
                      ],
                    ),
                  );
                },
                key: const ValueKey(null),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWitdth * 0.025,
                      vertical: screenHeight * 0.025,),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: screenWitdth * 0.02,
                            right: screenWitdth * 0.04,),
                          child: Card(
                            elevation: 5,
                            color: ColorConfig.primaryColor,
                            child: Image.asset(
                              "assets/images/product.png",
                              width: 60,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWitdth * 0.52,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              Text(
                                'employee name',
                                style: TextStyle(fontSize: screenHeight * 0.035),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: screenHeight * 0.012),
                                child: Text(
                                  'employee address',
                                  style: TextStyle(fontSize: screenHeight * 0.030),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: screenHeight * 0.012),
                                child: Text(
                                  'employee mobile no',
                                  style: TextStyle(fontSize: screenHeight * 0.030 ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          elevation: 10,
                      
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWitdth * 0.008,
                                vertical: screenHeight * 0.006,
                              ),
                            child: Icon(
                              Icons.edit,
                               color: ColorConfig.appbarColor,
                              size: screenHeight * 0.05,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}