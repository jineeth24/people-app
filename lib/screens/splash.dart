import 'package:brototype/homepage.dart';
import 'package:brototype/main.dart';
// import 'package:brototype/newapp.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../loginpage.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

 @override 
 void initState(){
  checkUserLoggedIn();
  super.initState();
 }
 @override 
 void didChangeDependencies(){
  super.didChangeDependencies();
 }



  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("PEOPLE",style: TextStyle(fontSize: 35),)),
    );
  }

  // @override 
  // void dispose(){
  //   super.dispose();
  // }

  //checking sharedpref so a future function
  Future<void>gotoLogin() async{
   await Future.delayed(
      Duration(seconds: 3));
       Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Login( )));
  }


  Future<void> checkUserLoggedIn () async{
    final _sharedprefs=await SharedPreferences.getInstance();
    final _userLoggedIn=_sharedprefs.getBool(SAVE_KEY_NAME);
    if(_userLoggedIn==null||_userLoggedIn==false){
      gotoLogin();
    }
    else
    {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>Homep()));
  }
  }


}
