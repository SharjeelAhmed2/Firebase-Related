import 'package:firebaseapp/pics/uploadpics.dart';
import 'package:firebaseapp/services/auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({ Key key }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

   final AuthClass _authClass = AuthClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.person_add_disabled), 
          onPressed:(){
            _authClass.signOUt();
          })
        ],
      ),
      body: Column(children: [
        FlatButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadImages()));
        }, child: Text("Go upload pictures"))
      ],)
    );
  }
}