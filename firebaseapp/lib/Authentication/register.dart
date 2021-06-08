import 'package:firebaseapp/Authentication/decide.dart';
import 'package:firebaseapp/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({ Key key }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

    String email = '';
   String password = '';
   final AuthClass authClass = AuthClass();
   GlobalKey<FormState> formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen"),actions: [
        IconButton(icon: Icon(Icons.arrow_back), onPressed: 
        (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Decide()));
        })
      ],),
      body: (
        Center(child: 
        SingleChildScrollView(child: 
        Form(
          key: formkey,
          child: Column(children: [

  
                          Container(
                            padding: EdgeInsets.only(top: 40),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey[400]))),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    //    contentPadding: EdgeInsets.only(top: 4),
                                    prefixIcon: Icon(
                                      Icons.mail,
                                      color: Colors.redAccent,
                                    ),
                                    hintText: "Enter your Email",
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Railway')),
                                         onChanged:(val)
                                        {
                                          setState(() {
                                            email = val;
                                            });
                                        },
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return "Wrong Email-Address";
                                  }
                                }
                                ),
                          ),
     
                          Container(
                            padding: EdgeInsets.only(top: 40),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey[400]))),
                            child: TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    //    contentPadding: EdgeInsets.only(top: 4),
                                    prefixIcon: Icon(
                                      Icons.mail,
                                      color: Colors.redAccent,
                                    ),
                                    hintText: "Enter your Password",
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Railway')),
                                        onChanged:(val)
                                        {
                                          setState(() {
                                            password = val;
                                            });
                                        },
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return "Wrong Email-Address";
                                  }
                                }
                                ),
                          ),
            FlatButton(
              color: Colors.indigo[900],
              onPressed: (){
                if(formkey.currentState.validate())
                {
              dynamic result = authClass.registerUser(email, password);
                }
            }, child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("Register", style: TextStyle(color: Colors.white, 
              fontSize: 20
              ),),
            )
            ),
          ],
          ),
        ),
        ),
      
        )
      )
    );
  }
}