import 'package:cloud_firestore/cloud_firestore.dart';

 class Selfleadelete{
//  final String id;
//Selfleadelete(this.id);
Selfleadelete();
CollectionReference selflead =
      FirebaseFirestore.instance.collection('selflead');

   Future<void>  deleteSelflead(id) {
    return selflead
        .doc(id)
        .delete()
        .then((value) => print('selflead deleted'))
        .catchError((error) => print('Fail: $error'));
  }


}

class VisitedLeadDelete{
  VisitedLeadDelete();
  CollectionReference selfvisitedlead =
      FirebaseFirestore.instance.collection('selfvisitedlead');

    Future<void>  deletevisitedlead(id) {
    return selfvisitedlead
        .doc(id)
        .delete()
        .then((value) => print('selfvisitedlead deleted'))
        .catchError((error) => print('Fail: $error'));
  }

}