import 'dart:async';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './addmanually.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reminder/modal/event.dart';
import 'package:reminder/dbutils/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import './Auth.dart';
//import 'package:reminder/main.dart';
import './loginpage.dart';
import 'package:rounded_floating_app_bar/rounded_floating_app_bar.dart';
//import 'globals.dart' as globals;
import './FadeAnimation.dart';
import './favorite.dart';
//import './deleted.dart';
//import './settings.dart';
//import 'package:googleapis/gmail/v1.dart';
//import 'package:googleapis_auth/auth_io.dart';


class MainPage extends StatefulWidget {
 // final UserDetails detailsUser;
//  MainPage({Key key,@required this.detailsUser}): super (key: key);
  @override
  State createState() => new MainPageState();
}

class MainPageState extends State<MainPage> {
  //final GoogleSignInAccount googleUser;
  //final FirebaseUser firebaseUser;
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Event> eventList;
  int count = 0;
          
  //final GoogleSignIn _gSignIn = GoogleSignIn();
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    'email',
    //'profile',
    //'https://www.googleapis.com/auth/gmail.readonly'
  ]);
 //void  _logout() async{
    //await _googleSignIn.signOut();
   
    //await FirebaseAuth.instance.signOut();
    //AuthPage().getCurrentUser() == null;
  //  Navigator.push(
    //  context,
    //  MaterialPageRoute(builder: (context) => LoginPage()),
   // );
  //}
  //checknull(){
   //if (_googleSignIn.currentUser.photoUrl== null) {
     //check = true;
  // }
  // else check = false;
  //}
  @override MainPage get widget=> super.widget;
  Widget build(BuildContext context) {
    if (eventList == null) {
      eventList = List<Event>();
      updateListView();
    }

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isInnerBoxScroll) {
          return [
            RoundedFloatingAppBar(
              actions: <Widget>[
                IconButton(
                  icon: CircleAvatar(
                    radius: 18,
                    //backgroundImage: NetworkImage(
                     // widget.detailsUser.photoUrl
                      backgroundColor:
                        Theme.of(context).platform == TargetPlatform.iOS
                            ? Colors.blue
                          : Colors.green,
                     child: Text("U", style: TextStyle(fontSize: 20.0)),
                    //),
                  ),
                  onPressed: () {
                    //print(authService.user.displayName);
                    //print(LoginPage();
                    //SizedBox(
                    // width: 200.0,
                     //height:300.0, 
                     
                     showDialog(
                      
                        context: context,
                        
                        child: new AlertDialog(
                          
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.all(Radius.circular(10.0))
                             ),
                          title: new Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Text("E-Reminder"),
                              //Text("E-Reminder"),
                            ],
                          ),
                          content: Column(
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                
                                  //_googleSignIn.currentUser.displayName),
                                  //widget.detailsUser.userName
                                  //authService.user.displayName),
                                  'Rehman'),
                                 
                                subtitle: Text(
                                  //authService.user.email
                                  'gmail.com'
                                  ),
                                  //widget.detailsUser.userEmail
                                //),
                                //widget.detailsUser.userEmail
                                  //_googleSignIn.currentUser.email
                                //leading: CircleAvatar(
                                  //       radius: 18,
                                    //     backgroundImage: NetworkImage(
                                      //   authService.user.photoUrl
                                        // ),
                                        // ),
                                         ),
                              SizedBox(
                                width: double.infinity, // match_parent
                                child: RaisedButton(
                                  textColor: Colors.black,
                                  color: Colors.white,
                                  child: Text("Manage your Account"),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                width: double.infinity, // match_parent
                                child: RaisedButton(
                                  textColor: Colors.black,
                                  color: Colors.white,
                                  child: Text("Logout"),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                  onPressed: () {
                              
                                    authService.signOut();
                                    //if{
                                    //}  
                                   Navigator.push(
                                   context,
                                   MaterialPageRoute(builder: (context) => LoginPage()),
                                   );
                                  },
                                ),
                              ),
                              SizedBox(height: 10),
                              Divider(
                                height: 1,
                                thickness: 0.5,
                                color: Colors.green[900],
                              ),
                            ],
                          ),
                        
                        ));
                  },
                ),
              ],
              floating: true,
              snap: true,
              title: Text("EVENTS",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              backgroundColor: Colors.white,
            ),
          ];
        },
      body: getEventListView(),
      
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToDetail(Event('', '', '', '', ''), 'Add Event');
          // Navigator.push(context, MaterialPageRoute(builder: (context) => AddeventM()));
        },
        child: Icon(Icons.add),
        foregroundColor: Colors.black,
        tooltip: 'Add Event',
        backgroundColor: Colors.white,
      ),
  drawer: Drawer(
    
        child: Container(
          
            //decoration: ,
            padding: EdgeInsets.all(12.0),
            //margin: EdgeInsets.all(4.0),
            child: Column(
              children: <Widget>[
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Positioned(
                  //top: 5,
                  //height: 10,
                  //width:  10,  
                   //Positioned(
                   //height: 10,
                  //width:  10,
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(12.0),
                   child: Text(
                     
                     "E-Reminder",style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold, fontSize:25),
                   
                  
                  )
                  
                  ),
                ]
            ),
                  
                  SizedBox(height: 40,),
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
                              color: Colors.white,
                              )
                              )
                              ),
                             child:ListTile(
                               title: Text(
                             'All Events',
                              style: TextStyle(fontSize: 18),
                              ),
                             leading: Icon(
                             Icons.description,
                             color: Colors.yellow,
                              size: 30,
                          ),
                              onTap: () {
                                  Navigator.pop(context);
                                }
                              ), 
                        ),
                      SizedBox(height: 9),
                              Divider(
                                height: 1,
                                thickness: 0.5,
                                color: Colors.green[900],
                              ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: ListTile(
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.blue,
                    size: 30,
                  ),
                  title: Text(
                    'Favorites',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: (){
                    
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>FavoritePage() ));
                  },
                  ),
                  ),
                            SizedBox(height: 9),
                              Divider(
                                height: 1,
                                thickness: 0.5,
                                color: Colors.green[900],
                              ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: ListTile(
                  leading: Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 30,
                  ),
                  title: Text(
                    'Recently Deleted',
                    style: TextStyle(fontSize: 18),
                  ))),
                      ],
                        )
                        )
                  ),
                  SizedBox(height: 9),
                              Divider(
                                height: 1,
                                thickness: 0.5,
                                color: Colors.transparent
                              ),
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
                    //new Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(
                              color: Colors.white,
                              )
                              )
                              ),
                             child:ListTile(
                             leading: Icon(
                             Icons.settings_applications,
                             
                             color: Colors.black,
                              size: 30,
                             ),
                             title: Text(
                             'Settings',
                              style: TextStyle(fontSize: 18),
                              )
                             )
                              ),
                              SizedBox(height: 3),
                              Divider(
                                height: .5,
                                thickness: 0.3,
                                color: Colors.black
                              ),
                              Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(
                              color: Colors.white,
                              )
                              )
                              ),
                             child:ListTile(
                               //start
                               //crossAxisAlignment: CrossAxisAlignment.start,
                               title: Text(
                             'About',
                              style: TextStyle(fontSize: 18),
                              ),
                             leading: Icon(
                             Icons.info,
                             
                             color: Colors.black,
                              size: 30,
                             ),
                             onTap: (){
                               showAboutDialog(context: context,
                               applicationVersion: '1.0.0',
                               applicationName: 'E-Reminder',
                               //applicationIcon: Image.asset('assets/E.png'
                              // ),
                               applicationLegalese: 'This Application is Develpoed by Abdul Rehman'
                             );
                             },
                             )
                              ),
                      ]
                    ) 
                  )
                  ),
              ]
                    ),
                  ),
  ),
            //children: <Widget>[
              //Container( 
                //padding: EdgeInsets.all(12.0),
              //SizedBox(
                
                //child: Text('Events',
                 // textAlign: TextAlign.start,
                 // style: TextStyle(
                  //  fontSize: 28,
                 // )
                 // )
              //)
                //  ),
                  
              //ListTile(
                //  leading: Icon(
                //    Icons.description,
                //    size: 30,
                //  ),
                //  title: Text(
                //    'All Events',
                //    style: TextStyle(fontSize: 22),
              //    )),
              //ListTile(
                  //leading: Icon(
                //    Icons.favorite,
                //    size: 30,
                //  ),
               //   title: Text(
              //      'Favoites',
               //     style: TextStyle(fontSize: 22),
               //   )),
              //ListTile(
               //   leading: Icon(
               //     Icons.delete,
               //     size: 30,
                //  ),
                //  title: Text(
                //    'Recently Deleted',
                //    style: TextStyle(fontSize: 22),
                //  )),
              //ListTile(
                 // leading: Icon(
                  //  Icons.settings,
                  //  size: 30,
                  //),
                  //title: Text(
                   // 'Settings',
                   // style: TextStyle(fontSize: 22),
                  //))
    

            //textAlign: TextAlign.center,
            //style: TextStyle(fontSize: 30,
            //backgroundColor: Colors.white12

            //),
//          ]
           // ),
            
           );
        
  }   
  ListView getEventListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(Icons.access_time),
            ),
            title: Text(
              this.eventList[position].title +
                  ' at ' +
                  this.eventList[position].location,
              style: titleStyle,
            ),
            subtitle: Text(this.eventList[position].date +
                ' at ' +
                this.eventList[position].time),
            trailing: Wrap(
              spacing: 13,
              children: <Widget>[
                GestureDetector(
                  child: Icon(
                    Icons.favorite,
                    color: Colors.black,
                  ),
                  onTap: () {},
                ),
                GestureDetector(
                    child: Icon(
                      Icons.delete,
                      color: Colors.black,
                    ),
                    onTap: () {
                      _delete(context, eventList[position]);
                    }),
              ],
            ),
            onTap: () {
              debugPrint('ListTitle pressed');
              navigateToDetail(this.eventList[position], 'Edit Event');
            },
          ),
        );
      },
    );
  }
  
//Color getPriorityColor(int date,int time){
//  (date && time){
// }
//}
  void _delete(BuildContext context, Event event) async {
    int result = await databaseHelper.deleteEvent(event.id);
    if (result != 0) {
      _showSnackBar(context, 'Event Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Event event, String til) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddeventM(event, til);
    }));
    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initilizeDatabase();
    dbFuture.then((database) {
      Future<List<Event>> eventListFuture = databaseHelper.getEventList();
      eventListFuture.then((eventList) {
        setState(() {
          this.eventList = eventList;
          this.count = eventList.length;
        });
      });
    });
  }
}
//class UserDetails{
//  final String providerDetails;
//  final String userName;
//  final String photoUrl;
//  final String userEmail;
//  final List<ProviderDetails> providerData;
//  UserDetails(this.providerDetails,this.userName,this.photoUrl,this.userEmail,this.providerData);
//}
//class ProviderDetails{
//  ProviderDetails(this.providerDetails);
//  final String providerDetails;
//}