//import './loginpage.dart';
//import './mainpage.dart';
//import 'package:reminder/main.dart';
//import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:googleapis_auth/auth_io.dart';
import "package:http/http.dart" as http;
//import 'package:googleapis_auth/auth.dart';
//import 'package:googleapis_auth/auth_browser.dart';
//import 'package:googleapis_auth/auth_io.dart';
//import "package:googleapis/gmail/v1.dart";
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:rxdart/rxdart.dart';
//import './loginpage.dart';
import 'package:googleapis/gmail/v1.dart';
class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes:[
    'email',
    //'profile',
    'https://www.googleapis.com/auth/gmail.readonly',
  ]);
  final FirebaseAuth _auth = FirebaseAuth.instance;
//  final Firestore _db = Firestore.instance;

  FirebaseUser user; // firebase user
  //Observable<Map<String, dynamic>> profile; // custom user data in Firestore
  //PublishSubject loading = PublishSubject();

  // constructor
  //AuthService() {
    //user = Observable(_auth.onAuthStateChanged);

    //profile = user.switchMap((FirebaseUser u) {
      //if (u != null) {
        //return _db
         //   .collection('users')
         //   .document(u.uid)
        //    .snapshots()
       //     .map((snap) => snap.data);
      //} else {
      //  return Observable.just({});
     // }
   // });
  //}
  //firebase_auth: ^0.8.4+4
  //google_sign_in: ^4.5.1



    Future<FirebaseUser> googleSignIn() async {
    try {
      //loading.add(true);
      final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount.authentication;
          //print("user email");
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
         user = (await _auth.signInWithCredential(credential));
      //updateUserData(user);
      print("user id: ${user.uid}");
      print("user name: ${user.displayName}");
      print("user email: ${user.email}");
      print("user email");
      //LoginPageState().navi();
      //loading.add(false);
      //print(
       //Get https://gmail.googleapis.com/gmail/v1/users/user.email/messages
        //)
      return user;
    } catch (error) {
      print (error);
    }
  }
  
//var id = new ClientId("....apps.googleusercontent.com", "...");
//var scopes = ['https://www.googleapis.com/auth/gmail.readonly'];

//var client = new http.Client();
//obtainAccessCredentialsViaUserConsent(id, scopes, client, prompt)
  //  .then((AccessCredentials credentials) {
  // Access credentials are available in [credentials].
  // ...
 // client.close();
//});

//void prompt(String url) {
 // print("Please go to the following URL and grant access:");
  //print("  => $url");
  //print("");
//}



  //void updateUserData(FirebaseUser user) async {
   // DocumentReference ref = _db.collection('users').document(user.uid);
     
     //return ref.setData({
       //     'uid': user.uid,
      //'email': user.email,
     // 'photoURL': user.photoUrl,
     // 'displayName': user.displayName,
     // 'lastSeen': DateTime.now()
    //}, merge: true);
 // }
//data(){
//print(user.displayName);  
//}
  Future<String> signOut() async {
    try {
      await _googleSignIn.signOut();
      return 'SignOut';
      //Navigator.push(
      //context,
      //MaterialPageRoute(builder: (context) => LoginPage()),
    //);
    } catch (e) {
      return e.toString();
    }
  }
}
final AuthService authService = AuthService();
