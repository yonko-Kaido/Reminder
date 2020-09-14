import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './FadeAnimation.dart';
import './mainpage.dart';
import './Auth.dart';
//import './Auth.dart';
//import './profileScreen.dart';
import 'globals.dart' as globals;
//import 'package:googleapis/gmail/v1.dart';
//import 'package:googleapis_auth/auth_io.dart';
//ImageCache.clear();
//void main() => runApp(new LoginPage());
class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState(); 
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  String name;
  
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes:[
    'email',
    //'profile',
    'https://www.googleapis.com/auth/gmail.readonly'
  ]);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //_login()async{
    Future<FirebaseUser> _login() async {
      try{
     final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
     final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;
  final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
  FirebaseUser userDetails =  (await _firebaseAuth.signInWithCredential(credential));
  print(userDetails.email);
   //try{
     //await _googleSignIn.signIn();
     ///setState(() {
       //name=_googleSignIn.currentUser.displayName;
     //print(_googleSignIn.currentUser.displayName);
     //}
     Navigator.push(context, MaterialPageRoute(builder: (context) =>MainPage() ),
     
     );
     
     return userDetails;                   
   }
   catch(err){
    print (err);
   }
  }
  navi(){
    Navigator.push(context, MaterialPageRoute(builder: (context) =>MainPage() ),
     );
  }
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;
  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height:250,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -40,
                    height: 300,
                    width: width,
                    child: FadeAnimation(1, Container(
                      decoration: BoxDecoration(
                        image:DecorationImage(
                          image: AssetImage('assets/112.png'),
                          fit: BoxFit.fill
                          )
                      ),
                    ),
                    ),
                  ),
                  Positioned(
                    height: 300,
                    width: width+20,
                    child: FadeAnimation(1, Container(
                      decoration: BoxDecoration(image: DecorationImage(
                        image:AssetImage('assets/112.png'), 
                        fit: BoxFit.fill
                        )
                      ),

                    ),
                    ),

                  )
                ],
                   
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal:40),
              child: Column(
                //Padding(padding: EdgeInsets.symmetric(horizontal:40),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(1,Text("E-Reminder",style: TextStyle(color: Color.fromRGBO(49,39,79,1),
                  fontWeight: FontWeight.bold, fontSize:25),)),
                  SizedBox(height: 30,),
                  FadeAnimation(1,Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(196, 135, 198, .3),
                          blurRadius: 20,
                          offset: Offset(0, 10)
                          )
                      ]
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(
                              color: Colors.grey[200]
                              )
                              )
                          ),
                          child: TextField(
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                             //  validator: (value) => value.isEmpty ? 'Email can\'t be empty': null,
                              labelText: "Gmail",
                              labelStyle:TextStyle(color: Colors.grey, fontSize: 25.0),
                              hintStyle: TextStyle(color: Colors.blue, fontSize: 20.0)
                            ),
                              
                               keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            obscureText: true,
                            decoration: new InputDecoration(
                            border: InputBorder.none,
                              labelText: "Password",
                              labelStyle:TextStyle(color: Colors.grey, fontSize: 25.0),
                              hintStyle: TextStyle(color: Colors.blue, fontSize: 20.0)
                            ),
                        )
                        ),
                      ]
                    ),
                  )),
                  SizedBox(height:20,),
                  FadeAnimation(1.1,Center(child: Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(196, 135, 198, 1)),
                  ),)),
                  Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                       FadeAnimation(1.1,  MaterialButton(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        ),
                        height: 50.0,
                        minWidth: 140.0,
                        color: Colors.red,
                        splashColor: Colors.teal,
                        textColor: Colors.black,
                        child: Text('Login',style:TextStyle(color: Colors.black, fontSize: 25.0),),
                        onPressed: ()
                        {
                           globals.isloggedIn = true;
                          //validateandsubmit();
                          //Navigator.push(context, MaterialPageRoute(builder: (context) =>MainPage(detailsUser: details)));
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>MainPage() ));
                        }  
                       )
                      ),
                      ]
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                      ),
                      //SizedBox(
                        //width: 400.0,
                        //crossAxis
                        FadeAnimation(1.1, RaisedButton(
                          
                          
                          elevation: 15.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        color: Colors.white,
                        splashColor: Colors.teal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.google,color: Colors.red),
                            SizedBox(width: 10.0,),
                            Text('Sign in with Google',
                            style: TextStyle(color: Colors.black,fontSize: 18.0),
                            ),
                          ]
                        ),
                      
                          onPressed: () {
                          authService.googleSignIn();
                          //authService.data();
                          //print(authService.user.displayName);
                         // Navigator.push(context, MaterialPageRoute(builder: (context) =>MainPage() ),);
                           // _login();
                           // print(_googleSignIn.currentUser.id);
                             //globals.isloggedIn = true;
                            //AuthPage._loggedIn(false);
                          }
                        )
                        ),
                      //),
                        SizedBox(height:30,),
                        FadeAnimation(1.1, Center(child: Text("Create Account", style: TextStyle(color:Color.fromRGBO(49, 39, 79, .6)),))),
                ]
              )
              )
          ]
              ),
            )
    );
  }
    }
      
      
      
//  //     new Stack(fit: StackFit.expand, children: <Widget>[
//         //new Image(
//          // image: new AssetImage('assest/E.png'),
//          // Image image=Image(image: width: 250.0,heigth: 250.0); 
         
//         //  fit: BoxFit.cover,
//          // colorBlendMode: BlendMode.lighten,
//          // color: Colors.green,
//        // ),
//         //globals.islogedIn
//       //  ? 
//     //    Navigator.push(context, MaterialPageRoute(builder: (context) =>MainPage() ),
//   //)
        



//        new Theme(
//           data: new ThemeData(
//               brightness: Brightness.light,
//               inputDecorationTheme: new InputDecorationTheme(
//                  hintStyle: new TextStyle(color: Colors.blue, fontSize: 20.0),
//                 labelStyle:
//                     new TextStyle(color: Colors.black, fontSize: 25.0),
//               )),
//           isMaterialAppTheme: true,
//           child: new Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               //new FlutterLogo(
//               //  size: _iconAnimation.value * 140.0,
//             //  ),
//              new Container(
//                 padding: const EdgeInsets.all(40.0),
//                 child: new Form(
//                   autovalidate: true,
//                   child: new Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: <Widget>[
//                       new TextFormField(
//                         decoration: new InputDecoration(labelText: "Gmail"),
                
//                          // validator: (value) => value.isEmpty ? 'Email can\'t be empty': null,
//                            // keyboardType: TextInputType.emailAddress,
//                       ),
//                       new TextFormField(
//                         obscureText: true,
//                         decoration: new InputDecoration(

//                           labelText: "Password"
//                         ), 
//                        // validator: (value) => value.isEmpty ? 'Password can\'t be empty': null,
                        
//                       ),
//                       new Padding(
//                         padding: const EdgeInsets.only(top: 60.0),
//                       ),
//                       new MaterialButton(
//                         shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20.0),
//                         ),
//                         height: 50.0,
//                         minWidth: 140.0,
//                         color: Colors.red,
//                         splashColor: Colors.teal,
//                         textColor: Colors.black,
//                         child: Text('Login'),
//                         onPressed: ()
//                         {
//                           //validateandsubmit();
//                           //Navigator.push(context, MaterialPageRoute(builder: (context) =>MainPage(detailsUser: details)));
//                           Navigator.push(context, MaterialPageRoute(builder: (context) =>MainPage() ));
//                         }  
                        
//                       ),
//                     new Padding(
//                         padding: const EdgeInsets.only(top: 25.0),
//                       ),
//                       //new OutlineButton(
//                         //child: Text('Loggout'), 
//                         //onPressed:()=> _login()
//                       //),

//                         new RaisedButton(
                          
                         
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20.0),

//                         ),
//                         color: Color(0xfffff), 
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Icon(FontAwesomeIcons.google,color: Color(0xffCE107C)),
//                             SizedBox(width: 10.0,),
//                             Text('Sign in with Google',
//                             style: TextStyle(color: Colors.black,fontSize: 18.0),
//                             ),
//                           ]
//                         ),
                      
//                           onPressed: () {
//                             _login();
//                           //  AuthPage().getCurrentUser();}
//                           //.then((FirebaseUser user)=>print(user))
//                           //.catchError((e)=> print(e)),
//                           }
//                         )
//                     ],
//                   ),
//                ),
//               )
//            ],
//           ),
//         )
//       ]),
//     );
//   }
//} 