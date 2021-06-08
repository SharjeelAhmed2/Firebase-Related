import 'package:firebaseapp/Authentication/authenticate.dart';
import 'package:firebaseapp/home.dart';
import 'package:firebaseapp/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatelessWidget {
  const Wrapper({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final userWrapper = Provider.of<UserClass>(context);
    
    if(userWrapper == null)
      return Authenticate();
      else{
        return Homepage();
      }
  }
}