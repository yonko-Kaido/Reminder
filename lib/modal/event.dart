class Event{
int _id;
String _title;
String _description;
String _location;
String _date;
String _time;


Event(this._title,this._location,this._date,this._time,[this._description]); 
Event.withID(this._id,this._title,this._location,this._date,this._time,[this._description]);

int get id=> _id;
String get title=>_title;
String get description => _description;
String get location => _location;
String get date=> _date;
String get time => _time;
set title(String newTitle){
  if(newTitle.length<=100){
    this._title =newTitle;
  }
}
set description(String newDescription){
  if(newDescription.length<=250){
    this._description =newDescription;
  }
}
set location(String newLocation){
  if(newLocation.length<=50){
    this._location =newLocation;
  }
}
set date(String newDate){
    this._date =newDate;
  
}
set time(String newTime){
    this._time =newTime;
}

// convert a Event object into Map object
Map<String,dynamic> toMap(){

  var map=Map<String, dynamic>();
  if(id != null){
    map['id'] =_id;
  }
    map['title'] =_title;
    map['description'] =_description;
    map['location'] =_location;
    map['date'] =_date;
    map['time'] =_time;

  return map;
}

// Extract a Event object from a Map object

Event.formMapObject(Map<String,dynamic> map){
this._id = map['id'];
this._title = map['title'];
this._description = map['description'];
this._location = map['location'];
this._date = map['date'];
this._time = map['time'];
}














}