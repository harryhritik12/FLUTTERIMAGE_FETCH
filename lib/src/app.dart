//Import helper liberary
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/imagemodel.dart';
import 'dart:convert';
import 'widget/image_list.dart';
//create class that will be our custom widget

//this classm must extend the stateswidget base class
class App extends StatefulWidget{
 
  createState() {
    // TODO: implement createState
    return AppState();
  }
} 
class AppState extends State<App>{
//must build method that return 
// the widget that this widgetwill show
   int counter = 0;
   List<ImageModel> images = [];
   void fetchImage() async{
    counter++;
  var response=
   await get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'));
     var imageModel=ImageModel.fromJson(json.decode(response.body) ); 
   setState(() {
   images.add(imageModel);  
   });
   
   }
Widget build(context){
return MaterialApp( 
    home:Scaffold( 
      body: ImageList(images),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:fetchImage,
      ),
      appBar:AppBar(
        title:Text('Lets see some images!'),
      ), 
      ),
    );
  // take the widget and get it on the screen
 }  

}
//https://jsonplaceholder.typicode.com/photos
/* ImageModel.fromJson(Map<String,dynamic> parsedJson){
      id=parsedJson["id"];
      url=parsedJson["url"];
      title=parsedJson["title"];
  } 
  */