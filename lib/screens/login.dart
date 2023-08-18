import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return    Scaffold(
      body: Column(
        children: [
          TextFormField(
           // decoration: InputDecoration,
          ),
          TextFormField(),
          ElevatedButton(onPressed: (){}, child:const Text("Login")),
        ],
      ),
    );
  }
}