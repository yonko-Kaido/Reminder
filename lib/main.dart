import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:reminder/Screens/Auth.dart';
import 'package:reminder/Screens/loginpage.dart';
//import 'package:reminder/Screens/Auth.dart';
//import 'package:reminder/Screens/mainpage.dart';
//import 'package:reminder/Screens/auth.dart';
//import 'package:reminder/screens/globals.dart' as globals;

//import './auth.dart';
//import './profileScreen.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "EReminder",
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: //AuthPage().getData() == true
          //?
          //GSignIn()
          //MainPage()
          //MainPage(detailsUser: details));
          //: 
          LoginPage(),
      
    );
  }
}

//class StartPage extends StatefulWidget {
//  @override
//  _StartPageState createState() => _StartPageState();
//}

//class _StartPageState extends State<StartPage> {
//  @override
//  Widget build(BuildContext context) {
    
  //  return Scaffold(
      //body: AuthPage().getCurrentUser() != null
          //? 
          //GSignIn()
          //LogedInPage()
          //MainPage(detailsUser: details));
          //: 
          //GSignIn(),
          //LogedInPage(),
   // );
 // }
//}

//class LogedInPage extends StatefulWidget {
  //@override
  //_LogedInPageState createState() => _LogedInPageState();
//}

//class _LogedInPageState extends State<LogedInPage> {
 // UserDetails details;

  //void initState() {
   // super.initState();
  //  getCCurrent();
  //}

  //Future getCCurrent() async {
   // FirebaseUser _user = await FirebaseAuth.instance.currentUser();
   // ProviderDetails providerInfo = new ProviderDetails(_user.providerId);
   // List<ProviderDetails> providerData = new List<ProviderDetails>();
   // providerData.add(providerInfo);
   // details = UserDetails(
     // _user.providerId,
     // 'Rehman',
     // 'https://picsum.photo/id/451/200/300',
     // '@gmail.com',
     // providerData,
   // );
  //}

 // @override
  //Widget build(BuildContext context) {
  //  return Scaffold(body: MainPage(detailsUser: details));
 // }
//}

// class GSignIn extends StatefulWidget {
//   @override
//   GooSignInState createState() => GooSignInState();
// }

// class GooSignInState extends State<GSignIn>
//     with SingleTickerProviderStateMixin {
// //      Function f1 =new Function();
//  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//  // final GoogleSignIn _googleSignIn = new GoogleSignIn();
//  // Future<FirebaseUser> _singIn(BuildContext context) async {
//  //   final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
//  //   final GoogleSignInAuthentication googleAuth =
//   //      await googleUser.authentication;
//   //  final AuthCredential credential = GoogleAuthProvider.getCredential(
//   //      idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
//   //  FirebaseUser userDetails =
//   //      (await _firebaseAuth.signInWithCredential(credential)).user;
//   //  ProviderDetails providerInfo = new ProviderDetails(userDetails.providerId);
//   //  List<ProviderDetails> providerData = new List<ProviderDetails>();
//   //  providerData.add(providerInfo);
//   //  UserDetails details = new UserDetails(
//   //    userDetails.providerId,
//   //    userDetails.displayName,
//   //    userDetails.photoUrl,
//   //    userDetails.email,
//   //    providerData,
//   //  );
//    // Navigator.push(
//    //     context,
//      //   MaterialPageRoute(
//        //     builder: (context) => MainPage(detailsUser: details)));
//     //return userDetails;
//  // }
//   //  getCurrent() async {
//   //  FirebaseUser _user = await FirebaseAuth.instance.currentUser();
//   // ProviderDetails providerInfo = new ProviderDetails(_user.providerId);
//   //List<ProviderDetails> providerData = new List<ProviderDetails>();
//   //providerData.add(providerInfo);
//   // UserDetails details = new UserDetails(
//   // _user.providerId, _user.displayName, _user.photoUrl, _user.email, providerData,);
//   // Navigator.push(context, MaterialPageRoute(builder: (context) =>MainPage(detailsUser: details)));
//   // return _user;
//   // }
//   //if{
//   //  AuthPage().getCurrentUser() == null
//   //}

//   GoogleSignIn _googleSignIn = GoogleSignIn(scopes:['email']);
//   _login()async{
//   try{
//     await _googleSignIn.signIn();
//   //setState(() {
//    //globals.islogedIn =true;
//    //});
//   Navigator.push(context, MaterialPageRoute(builder: (context) =>MainPage() ),
//   );

//    }
//   catch(err){
//     print(err);
//    }
//   }
//   Animation<double> _iconAnimation;
//   AnimationController _iconAnimationController;
//   final formkey = new GlobalKey<FormState>();
//   //String _email;
//   //String _password;
//   bool validationandsave() {
//     final form = formkey.currentState;
//     if (form.validate()) {
//       form.save();
//       return true;
//     }

//     return false;
//   }

//   void validateandsubmit() {
//     if (validationandsave()) {
//       // try{
//       //FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)) as FirebaseUser;
//       //print('Signed in: ${user.uid}');
//     } else {
//       // print('Error: $e');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _iconAnimationController = new AnimationController(
//         vsync: this, duration: new Duration(milliseconds: 500));
//     _iconAnimation = new CurvedAnimation(
//       parent: _iconAnimationController,
//       curve: Curves.bounceOut,
//     );
//     _iconAnimation.addListener(() => this.setState(() {}));
//     _iconAnimationController.forward();
//   }

//   //    Navigator.push(context, MaterialPageRoute(builder: (context) =>MainPage() ),
//   //)

//   //LoginPage(),
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: new Stack(fit: StackFit.expand, children: <Widget>[
//         //new Image(
//         //image: new AssetImage('assest/E.png'),
//         //Image image=Image(image: width: 250.0,heigth: 250.0);

//         //fit: BoxFit.cover,
//         //colorBlendMode: BlendMode.lighten,
//         //color: Colors.green,
//         //),
//         //globals.islogedIn
//         //  ?
//         //    Navigator.push(context, MaterialPageRoute(builder: (context) =>MainPage() ),
//         //)

//         new Theme(
//           data: new ThemeData(
//               brightness: Brightness.light,
//               inputDecorationTheme: new InputDecorationTheme(
//                 // hintStyle: new TextStyle(color: Colors.blue, fontSize: 20.0),
//                 labelStyle: new TextStyle(color: Colors.black, fontSize: 25.0),
//               )),
//           isMaterialAppTheme: true,
//           child: new Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               //new FlutterLogo(
//               //size: _iconAnimation.value * 140.0,
//               //),
//               new Container(
//                 padding: const EdgeInsets.all(40.0),
//                 child: new Form(
//                   autovalidate: true,
//                   child: new Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: <Widget>[
//                       new TextFormField(
//                         decoration: new InputDecoration(labelText: "Gmail"),
//                         validator: (value) =>
//                             value.isEmpty ? 'Email can\'t be empty' : null,
//                         keyboardType: TextInputType.emailAddress,
//                       ),
//                       new TextFormField(
//                         obscureText: true,
//                         decoration: new InputDecoration(labelText: "Password"),
//                         validator: (value) =>
//                             value.isEmpty ? 'Password can\'t be empty' : null,
//                       ),
//                       new Padding(
//                         padding: const EdgeInsets.only(top: 60.0),
//                       ),
//                       new MaterialButton(
//                           //shape: RoundedRectangleBorder(
//                           //borderRadius: BorderRadius.circular(20.0),
//                           //)
//                           height: 50.0,
//                           minWidth: 140.0,
//                           color: Colors.red,
//                           splashColor: Colors.teal,
//                           textColor: Colors.black,
//                           child: Text('Login'),
//                           onPressed: () {
//                             //validateandsubmit();
//                             //Navigator.push(context, MaterialPageRoute(builder: (context) =>MainPage(detailsUser: details)));
//                             // Navigator.push(context, MaterialPageRoute(builder: (context) =>MainPage() ),
//                           }),
//                       new Padding(
//                         padding: const EdgeInsets.only(top: 25.0),
//                       ),
//                       //new OutlineButton(
//                       // child: Text('Loggout'),
//                       // onPressed:()=> _login()
//                       //),

//                       new RaisedButton(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20.0),
//                         ),
//                         color: Color(0xfffff),
//                         child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               Icon(FontAwesomeIcons.google,
//                                   color: Color(0xffCE107C)),
//                               SizedBox(
//                                 width: 10.0,
//                               ),
//                               Text(
//                                 'Sign in with Google',
//                                 style: TextStyle(
//                                     color: Colors.black, fontSize: 18.0),
//                               ),
//                             ]),
//                         onPressed: () => _login()
//                             .then((FirebaseUser user) => print(user))
//                             .catchError((e) => print(e)),
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         )
//       ]),
//     );
//   }
// }

//class UserDetails {
 // final String providerDetails;
 // final String userName;
 // final String photoUrl;
 // final String userEmail;
 // final List<ProviderDetails> providerData;
 // UserDetails(this.providerDetails, this.userName, this.photoUrl,
 //     this.userEmail, this.providerData);
//}

//class ProviderDetails {
 // ProviderDetails(this.providerDetails);
 // final String providerDetails;
//}

//import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:reminder/Screens/auth.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'Screens/loginpage.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'Screens/Auth.dart';
//import 'Screens/auth.dart';
//import 'Screens/mainpage.dart';
//void main() => runApp(new MyApp());

//class MyApp extends StatelessWidget {
//MyApp get widget=> super.widget;
//Future getCurrentUser () async {
//FirebaseUser _user = await FirebaseAuth.instance.currentUser();
// print("User: ${_user.displayName ?? "None"}");
// return _user;
// }
//Future getCurrentUserData() async {
// FirebaseUser userdetails = await FirebaseAuth.instance.currentUser();
// ProviderDetails providerInfo = new ProviderDetails(userdetails.providerId);
//List<ProviderDetails> providerData = new List<ProviderDetails>();
//providerData.add(providerInfo);
//UserDetails details = new UserDetails(
//userdetails.providerId, userdetails.displayName, userdetails.photoUrl, userdetails.email, providerData);
//MainPage(detailsUser: details);
//return userdetails;
//}
//@override
//Widget build(BuildContext context) {
//return  MaterialApp(
//debugShowCheckedModeBanner: false,
// title: "EReminder",
// theme: new ThemeData(primarySwatch: Colors.blue),
// home:
//  AuthPage().getCurrentUser() == null
// ?
// LoginPage()
//  :
//  AuthPage().getCurrent(),

//    Navigator.push(context, MaterialPageRoute(builder: (context) =>MainPage() ),
//)

//LoginPage(),

// );
//}
//}