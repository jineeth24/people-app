import 'package:brototype/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:brototype/app.dart';

const SAVE_KEY_NAME="_userLoggedIn";
void main(){
 
  runApp(
    App(),
  );
 }

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: SplashScreen(),
     
    );
  }
}