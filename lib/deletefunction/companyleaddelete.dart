import 'package:cloud_firestore/cloud_firestore.dart';

 class Companyleadelete{
//  final String id;
//Selfleadelete(this.id);
Companyleadelete();
CollectionReference companylead =
      FirebaseFirestore.instance.collection('companylead');

   Future<void>  deletecompanylead(id) {
    return companylead
        .doc(id)
        .delete()
        .then((value) => print('companylead deleted'))
        .catchError((error) => print('Fail: $error'));
  }


}

class CompanyVisitedLeadDelete{
  CompanyVisitedLeadDelete();
  CollectionReference companyvisitedlead =
      FirebaseFirestore.instance.collection('companyselfvisitedlead');

    Future<void>  deletevisitedlead(id) {
    return companyvisitedlead
        .doc(id)
        .delete()
        .then((value) => print('companyvisitedlead deleted'))
        .catchError((error) => print('Fail: $error'));
  }

}