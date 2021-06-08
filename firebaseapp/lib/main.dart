import 'package:firebaseapp/model/user.dart';
import 'package:firebaseapp/services/auth.dart';
import 'package:firebaseapp/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserClass>.value
    (value: AuthClass().userStream,
      initialData: null,
      child: MaterialApp(
      home: Wrapper(),
      ),
    );
  }
}

 