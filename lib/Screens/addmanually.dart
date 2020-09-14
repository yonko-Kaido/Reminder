import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:reminder/modal/event.dart';
import 'package:reminder/dbutils/database_helper.dart';
//import './mainpage.dart';
//import 'dart:async';

class AddeventM extends StatefulWidget{
 final String appBarTitle;
 final Event event;
 AddeventM(this.event,this.appBarTitle);

@override
     State<StatefulWidget> createState(){
     return AddeventMState(this.event,this.appBarTitle);
     }
}
class AddeventMState extends State<AddeventM>{
  String appBarTitle;
  Event event;
  DatabaseHelper helper = DatabaseHelper(); 
  TextEditingController titleController =TextEditingController();
  TextEditingController descriptionController =TextEditingController();
  TextEditingController locationController =TextEditingController();
  TextEditingController timeController =TextEditingController();
  TextEditingController dayController =TextEditingController();

  AddeventMState(this.event,this.appBarTitle);

  final format =DateFormat("yyyy-MM-dd");
  final timeformat =DateFormat("HH:mm");
  final dayformat =DateFormat("EEE, M/d/y");
  @override
  Widget build(BuildContext context) {
  TextStyle textStyle= Theme.of(context).textTheme.title;
  titleController.text=event.title;
  descriptionController.text=event.description;
  locationController.text =event.location;
  dayController.text= event.date;
  timeController.text=event.time;
    return new MaterialApp(
         debugShowCheckedModeBanner: false,
         title: 'E-Reminder',
      home: Scaffold(
         appBar: AppBar(
           title: Text(appBarTitle,
           //color:Colors.black,
           style: TextStyle(
             color: Colors.black
           ),
           ),
           backgroundColor: Colors.white, 
           elevation: 3.0,
          
          leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
            Navigator.pop(context);
          },
          color: Colors.black,
          ),
          //actions: <Widget>[
           // IconButton(icon: Icon(Icons.border_color), 
            //onPressed: (){
              //Navigator.pop(context);
              //setState((){
                   // debugPrint("Delete Button Clicked");
                   // _delete();
                  //});
              //setState(() {
               // _save();
              //});

            //},
           // color: Colors.black,
            
           // )
            //],

           ),
body: new Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             
              new Container(
                //margin: EdgeInsets.only(left: 20,top:20,right: 20,bottom:40),
                color: Colors.white,
                padding: const EdgeInsets.only(top:2.0,left:15.0,right:15.0, bottom: 2.0),
                child: new Form(
                  autovalidate: true,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new TextField(
                          controller:titleController,
                          style: textStyle,
                        
                         onChanged: (value){
                           debugPrint('');
                           updateTitle();
                         },
                        
                        decoration: new InputDecoration(labelText: "Event Title",
                        
                        ),
                
                          //validator: (value) => value.isEmpty ? 'Email can\'t be empty': null,
                            
                      ),
                       new Padding(
                      
                        padding: const EdgeInsets.only(top: 5.0,
                        bottom: 5.0
                        ),        
                      ),
                      new TextField(
                          controller:descriptionController,
                          style: textStyle,
                         onChanged: (value){
                           debugPrint('');
                           updateDescription();
                         },
                        
                        decoration: new InputDecoration(

                          labelText: "Event Description",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            //fontStyle: FontStyle.italic),
                          ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                            ),
                            //fillColor: Colors.black,
                            //filled: true,
                           // contentPadding: EdgeInsetsDirectional.only(top:20.0,bottom:20.0,start:5.0,end:5.0),
                            
                          

                          
                        ), 
                        //validator: (value) => value.isEmpty ? 'Password can\'t be empty': null,
                        
                      ),
                      new Padding(
                      
                        padding: const EdgeInsets.only(top: 5.0, 
                        bottom: 5.0
                        ),        
                      ),
                      new TextField(
                        
                        controller:locationController,
                          style: textStyle,
                         onChanged: (value){
                           debugPrint('');
                           updateLocation();
                         },
                        
                        decoration: new InputDecoration(

                          labelText: "Location",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                            ),
                          
                        ), 
                        //validator: (value) => value.isEmpty ? 'Password can\'t be empty': null,
                        
                      ),
                       new Padding(
                      
                        padding: const EdgeInsets.only(top: 5.0, 
                        bottom: .0
                        ),        
                      ),
                     // new Row(
                       // mainAxisAlignment: MainAxisAlignment.start,
                    //children: <Widget>[
                    //Text('Basic Date Field(${format.pattern})'),
                     new DateTimeField(
                       
                      controller: dayController,
                      format: dayformat,
                      style: textStyle,
                      onShowPicker: (context,currentValue) {
                       return showDatePicker(context: context,  
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                      },
                      onChanged: (value){
                           debugPrint('');
                           updateDay();
                         },
                         decoration: new InputDecoration(

                          labelText: "Pick Date",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              
                            ),
                         )
                    ),
                     new Padding(
                      
                        padding: const EdgeInsets.only(top: 5.0,
                         bottom: 5.0
                         ),        
                      ),
                    new DateTimeField(
                       
                      controller: timeController,
                      format: timeformat,
                      style: textStyle,
                      onShowPicker: (context,currentValue)async {
                       final time= await showTimePicker(context: context,  
                      
                        initialTime: TimeOfDay.fromDateTime (currentValue ?? DateTime.now()),
                       );
                        return DateTimeField.convert(time);
                      },
                      onChanged: (value){
                           debugPrint('');
                           updateTime();
                         },
                         decoration: new InputDecoration(

                          labelText: "Pick Time",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              
                            ),
                         )
                    ),
                    new RaisedButton(
                     color: Theme.of(context).primaryColorDark,
                    //textColor: Theme.of(context).primaryColorLigth,
                     child: Text(
                  'Save',
                  textScaleFactor: 1.5,
                ),
                   onPressed: (){
                     setState(() {
             _save();
              });
                 // setState((){
                   // debugPrint("Delete Button Clicked");
                   // _delete();
                 // }),
                  
                }
              ),
                    //]
                     // )
                      
                   ],
                  
                  ),

                 ),
                 
              ),
              
            ],
          ),   
        ),
      );
   }
   void updateTitle(){
     event.title=titleController.text;
   }  
   void updateDescription(){
     event.description=descriptionController.text;
   }  
   void updateLocation(){
     event.location=locationController.text;
   }  void updateDay(){
     event.date=dayController.text;
   }  
   void updateTime(){
     event.time=timeController.text;
   }
void _save()async{
  moveToLastScreen();
  int result;
  if(event.id!= null){
    result = await helper.updateEvent(event);
  }
  else {
    result = await helper.insertEvent(event);
  }
  if(result!= 0){
    _showAlertDialog('Status','Event Saved Successfully');
  }
  else{
    _showAlertDialog('Status','Problem Saving the Event');
  }
}
  void _showAlertDialog(String title,String message){
    AlertDialog alertDialog =AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context,
    builder: (_)=> alertDialog
    );
  }
void moveToLastScreen(){
  Navigator.pop(context,true);
}
void _delete()async{
  moveToLastScreen();
  if(event.id ==null){
  _showAlertDialog('status','No Event Deleted Successfully');
  return;
  }
int result = await helper.deleteEvent(event.id);
  if(result != 0){
   _showAlertDialog('Status','Event Deleted Successfully');
  }
  else{
    _showAlertDialog('Status','Error Occured While Deleting Event');
  }
}




}