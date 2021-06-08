import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebaseapp/model/user.dart';
import 'package:firebaseapp/services/database.dart';
//import 'package:google_sign_in/google_sign_in.dart';


class AuthClass
{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

   UserClass _firebaseUser(User user) {
     return user != null ? UserClass(uid: user.uid) :  null; 
   }
  

   /// Stream 
   
   Stream<UserClass> get userStream
   {
     return _firebaseAuth.authStateChanges().map(_firebaseUser);
   }

  // Google Sign-in
    
//    Future<UserCredential> signInWithGoogle() async {
//   // Trigger the authentication flow
//   final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//   // Create a new credential
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth.accessToken,
//     idToken: googleAuth.idToken,
//   );

//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }

  //Anonymous Sign-in

  Future signInAnony() async{
     try{
       UserCredential result = await _firebaseAuth.signInAnonymously();
       User userFirebase = result.user;
       return _firebaseUser(userFirebase);
     }
     catch(e)
     {
       print (e.toString());
       return null;
     }
  }


  //Sign Out 

  Future signOUt() async{
    try{
      return await _firebaseAuth.signOut();
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  // Registration 

      Future registerUser(String email, String password) async{
        try{
          UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password); 
          User userFirebase = result.user;
          // Create a Document for a new User upon registration
          await Database(uid: userFirebase.uid).updateUserData("Sharjeel");
          return _firebaseUser(userFirebase);
        }
        catch(e)
        {
          print(e.toString());
          return null;
        }
      }

      // Sign In
      Future signIn(String email, String password) async{
        try{
          UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password); 
          User userFirebase = result.user;
          return _firebaseUser(userFirebase);
        }
        catch(e)
        {
          print(e.toString());
          return null;
        }
      }
  
}