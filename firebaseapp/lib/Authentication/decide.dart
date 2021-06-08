import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/Authentication/login.dart';
import 'package:firebaseapp/Authentication/register.dart';
import 'package:firebaseapp/home.dart';
import 'package:firebaseapp/model/user.dart';
import 'package:firebaseapp/services/auth.dart';
import 'package:flutter/material.dart';

class Decide extends StatefulWidget {
  const Decide({ Key key }) : super(key: key);

  @override
  _DecideState createState() => _DecideState();
}

class _DecideState extends State<Decide> {
  
   final AuthClass _authClass = AuthClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Decide"),
        
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
                FlatButton(
                  color: Colors.indigo[900],
                  onPressed: ()async{
                  dynamic result = await _authClass.signInAnony();
                  if(result != null)
                  {
                    print(result);
                 //  
                  }
                  else{
                    print("not signed in");
                  }
                }
                , child: Text("Free Roaming", style: TextStyle(color: Colors.white, fontSize: 20),)),
           
                FlatButton(color: Colors.indigo[900],onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login())); 
                }, child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 20),)),

                FlatButton(color: Colors.indigo[900],onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Register())); 
                }, child: Text("Register", style: TextStyle(color: Colors.white, fontSize: 20),)),

                //  FlatButton(
                //    color: Colors.indigo[900],
                //    onPressed: () async {
                //    dynamic result = await _authClass.signInWithGoogle();
                //    if(result == null)
                //    {
                //      print("Failed to Log in");
                //    }
                //  }, 
                //  child: Text("Sign In with Google", style: TextStyle(color: Colors.white, fontSize: 20),)),
            ],
          ),
        ),
      ),
    );
  }
}