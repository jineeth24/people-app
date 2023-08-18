import 'package:brototype/homepage.dart';
import 'package:brototype/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  final _usernameController=TextEditingController();
  final _passwordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:const Text("login"),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: ListView(
            children: [
              Container(
                  height: 80,
                  child: Image.network(
                      "https://img.freepik.com/free-vector/group-young-people-posing-photo_52683-18824.jpg?w=2000")),
              const Center(
                child: Text(
                  "PEOPLE",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
               TextFormField(
                keyboardType: TextInputType.name,
                controller:_usernameController,

                decoration:const InputDecoration(
                    labelText: "User name", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: _passwordController,
                obscureText: true,
                // controller: password-controller,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                color: Colors.orange,
                width: 100,
                child: TextButton(
                    onPressed: () {
                     
                      checkLogin(context);
                     
               
                    },
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(color: Colors.black),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  //onpress funciton
  void checkLogin(BuildContext ctx)async{
    final _username=_usernameController.text;
    final _password=_passwordController.text;
    if(_username==_password&& (_username.isNotEmpty&&_password.isNotEmpty)){

      final _sharedpref= await SharedPreferences.getInstance();
      await _sharedpref.setBool(SAVE_KEY_NAME, true);
      //goto homepage
        Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx)=>Homep( )));
    }
    else{
    

      //snackbar//
      // ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
      //   content: Text("username password incorrect"),
      //   backgroundColor: Colors.red,
      //   ));

        //dialogue box
        showDialog(context: ctx, builder: (ctx1){
          return  AlertDialog(
            title:const Text("error"),
             content: const Text("username password doesnt match"),
             actions: [
              TextButton(onPressed: (){Navigator.pop(ctx1);}, child:const Text("close"))
             ],
            );
        });
  }
}

}