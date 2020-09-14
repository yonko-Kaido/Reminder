import 'package:flutter/material.dart';
class FavoritePage extends StatefulWidget {
  @override
  State createState() => new FavoritePageState(); 
}

class FavoritePageState extends State<FavoritePage>
   {
     @override Widget build(BuildContext context) {
    
    return Scaffold(
appBar: AppBar(
           title: Text('Deleted Events',
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
           ),
          body: Container(
            
           child: SizedBox(
             height: 200,
             width: 200,
            child: Text("No Deleted Event")
           )
          ), 





    );
  }
    
    
    }