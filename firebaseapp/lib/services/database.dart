import 'package:cloud_firestore/cloud_firestore.dart';

class Database{
  
   final String uid;
   Database({this.uid});

  // Collection Refernce 

  final CollectionReference peopleCollection = FirebaseFirestore.instance.collection('users');

  Future updateUserData(String name) async
  {
      // When it updates data, it will refer to the document with this UID
    return await peopleCollection.doc(uid).set({
      'name' : name
    });
    }

    Future uploadImage(String image) async
    {
      
    }
  }
