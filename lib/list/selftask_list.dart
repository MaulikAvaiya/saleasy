import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saleasy/DetailScreen/selftask_detail.dart';
import 'package:saleasy/EditForms/Self_lead_EditForm/edit_task.dart';
import 'package:saleasy/constant/color_config.dart';

class SelfTaskList extends StatefulWidget {
  const SelfTaskList({ Key? key }) : super(key: key);

  @override
  _SelfTaskListState createState() => _SelfTaskListState();
}

class _SelfTaskListState extends State<SelfTaskList> {
final Stream<QuerySnapshot> selftaskStream =
      FirebaseFirestore.instance.collection('selftask').snapshots();

  CollectionReference selftask =
      FirebaseFirestore.instance.collection('selftask');

  Future<void> deleteSelfTask(id) {
    return selftask
        .doc(id)
        .delete()
        .then((value) => print('task deleted'))
        .catchError((error) => print('Fail: $error'));
  }

  @override
  Widget build(BuildContext context) {

   return StreamBuilder<QuerySnapshot>(
        stream: selftaskStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('some thing went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final List storeDocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map product = document.data() as Map<String, dynamic>;
            storeDocs.add(product);
          }).toList();
    return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return Dismissible(
                background: Container(
                  color: Theme.of(context).errorColor,
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 40,
                  ),
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 4,
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
                            deleteSelfTask(snapshot.data!.docs[index].id);
                            Navigator.of(ctx).pop(true);
                          },
                        ),
                      ],
                    ),
                  );
                },
                key: const ValueKey(null),
                child: GestureDetector(
                  onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return SelfTaskDetail(
                          name: snapshot.data!.docs[index]['name'],
                          tasktype: snapshot.data!.docs[index]['tasktype'],
                        );
                      },
                    ),
                  );
                },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 7, right: 15),
                            child: Card(
                              elevation: 5,
                              color: ColorConfig.primaryColor,
                              child: Image.asset(
                                "assets/images/self-task.png",
                                width: 60,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 230,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:   [
                                Text(
                                  snapshot.data!.docs[index]['name'],
                                  style: TextStyle(fontSize: 20),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    snapshot.data!.docs[index]['tasktype'],
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                // Padding(
                                //   padding: EdgeInsets.only(top: 10),
                                //   child: Text(
                                //     'employee mobile no',
                                //     style: TextStyle(fontSize: 20),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () =>  Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return EditTask(
                                    id: snapshot.data!.docs[index].id);
                              },
                            )),
                            child: Card(
                              elevation: 10,
                        
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Icon(
                                  Icons.edit,
                                   color: ColorConfig.appbarColor,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
   );
  }
}