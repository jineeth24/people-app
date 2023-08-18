import 'package:flutter/material.dart';
import 'package:brototype/loginpage.dart';
import 'package:brototype/samples.dart';
import 'package:brototype/homepage.dart';



class App extends StatelessWidget{
  @override 
  Widget build(BuildContext context)
{
  return  MaterialApp(
  title: "loginapp",
  theme: ThemeData(primarySwatch: Colors.orange),
 
 home:Login(),
  routes: {
     '/login': (context) => Login(),
       '/homepage': (context) => Homep(),

  },
   
    
  );

//   );
 }
}