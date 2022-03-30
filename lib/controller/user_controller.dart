import 'package:firebase_auth/firebase_auth.dart';


bool isadmin=false;
bool isUser=false;
String user=isadmin?'admin':'user';

String userId=FirebaseAuth.instance.currentUser!.uid;

