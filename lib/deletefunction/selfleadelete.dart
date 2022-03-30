import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../controller/user_controller.dart';

 class Selfleadelete{
//  final String id;
//Selfleadelete(this.id);
Selfleadelete();
CollectionReference selflead =
  FirebaseFirestore.instance.collection(user).doc(userId).collection('selflead');

   Future<void>  deleteSelflead(id) {
    return selflead
        .doc(id)
        .delete()
        .then((value) => debugPrint('selflead deleted'))
        .catchError((error) => debugPrint('Fail: $error'));
  }


}

class VisitedLeadDelete{
  VisitedLeadDelete();
  CollectionReference selfvisitedlead =
      FirebaseFirestore.instance.collection(user).doc(userId).collection('selfvisitedlead');

    Future<void>  deletevisitedlead(id) {
    return selfvisitedlead
        .doc(id)
        .delete()
        .then((value) => debugPrint('selfvisitedlead deleted'))
        .catchError((error) => debugPrint('Fail: $error'));
  }

}