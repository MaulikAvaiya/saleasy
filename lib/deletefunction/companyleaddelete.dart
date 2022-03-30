import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../controller/user_controller.dart';

 class Companyleadelete{
//  final String id;
//Selfleadelete(this.id);
Companyleadelete();
CollectionReference companylead =
  FirebaseFirestore.instance.collection(user).doc(userId).collection('companylead');
   Future<void>  deletecompanylead(id) {
    return companylead
        .doc(id)
        .delete()
        .then((value) => debugPrint('companylead deleted'))
        .catchError((error) => debugPrint('Fail: $error'));
  }


}

class CompanyVisitedLeadDelete{
  CompanyVisitedLeadDelete();
  CollectionReference companyvisitedlead =
  FirebaseFirestore.instance.collection(user).doc(userId).collection('companyselfvisitedlead');
    Future<void>  deletevisitedlead(id) {
    return companyvisitedlead
        .doc(id)
        .delete()
        .then((value) => debugPrint('companyvisitedlead deleted'))
        .catchError((error) => debugPrint('Fail: $error'));
  }

}