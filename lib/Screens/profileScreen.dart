//import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import './auth.dart';
//import './loginpage.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//class ProfileScreen extends StatelessWidget{
  //final Userdetails detailsUser;
  //ProfileScreen({Key key,@required this.detailsUser}): super(key: key);
 // @override
  //Widget build(BuildContext context){
  //final GoogleSignIn _gsignIn = GoogleSignIn();
  //return Scaffold(
    //appBar: AppBar(
      //title: Text(detailsUser.userName),
      //actions: <Widget>[
        //IconButton(icon: Icon(FontAwesomeIcons.signOutAlt,size: 25.0,color:Colors.white), 
        //onPressed: (){
          //_gsignIn.signOut();
         // print('signed out');
        //  Navigator.pop(context);
      //  })
     // ],
    //), 
   // body: Center(child: 
    //Column(
    // mainAxisAlignment: MainAxisAlignment.center,
    //children: <Widget>[

      //CircleAvatar(
       // backgroundImage: NetworkImage(detailsUser.photoUrl),
      //  radius: 40.0,
      //),
      //SizedBox(height:10.0),
      //Text("Name: "+detailsUser.userName,
      //style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20.0), 
      //),
      //Text("Email: "+detailsUser.userEmail,
     // style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20.0), 
     // ),
    //],
   // )
    //),
   // );
 // }  
//}