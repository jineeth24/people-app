import 'package:brototype/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:brototype/samples.dart';

class Homep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Contact(),
    );
  }
  
}

class Contact extends StatelessWidget {
  List<String> names = [
    "Emma",
    "Liam",
    "Olivia",
    "Noah",
    "Ava",
    "Isabella",
    "Sophia",
    "Mia",
    "Charlotte",
    "Amelia",
    "Harper",
    "Evelyn",
    "Abigail",
    "Emily",
    "Elizabeth",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading:Icon(Icons.people_rounded),
        automaticallyImplyLeading: false,
        title: Text("Home"),
        actions:[
          IconButton(
            
            onPressed: (){logout( context);},
              // Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => true);
             // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx1)=>Login()), (route) => false);
           // },
             icon:const Icon(Icons.logout))
        ],


        ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        // child: ListView.builder(
        //   itemBuilder: (BuildContext Context, int index) {
        //     return Chat(index, names[index]);
        //   },
        //   itemCount: 15,
        // ),
        child:ListView.separated(
          itemBuilder: (BuildContext Context, int index) {
            return Chat(index, names[index]);
          },
          separatorBuilder:(BuildContext Context, int index){return const SizedBox(height: 15,);} , 
          itemCount: 15)
      ),
    );
  }

   logout(BuildContext ctx){
      showDialog(context: ctx, builder: (ctx1){
          return  AlertDialog(
            title:const Text("Logout"),
             content: const Text("you sure to logout?"),
             actions: [
              TextButton(onPressed: (){Navigator.pop(ctx1);}, child:const Text("cancel")),
              TextButton(onPressed: (){
                signout(ctx);
                // final _sharedprefs= await SharedPreferences.getInstance();
                // _sharedprefs.clear();
                // Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx1)=>Login()), (route) => false);
              }, 
              child:const Text("logout")),
             ],
            );
        });
    
  }
  signout(BuildContext ctx)async{

    final _sharedprefs= await SharedPreferences.getInstance();
    _sharedprefs.clear();

     Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx1)=>Login()), (route) => false); 

  }
  
 
  
}

class Chat extends StatelessWidget {
  var name;
  int i = 0;
  Widget? avatar;
  Chat(index, names) {
    // name=name[index];
    i = index;
    name = names;
  }

  Widget check() {
    if (i % 2 == 0) {
      return CircleAvatar();
    } else {
      return SquareAvatar();
    }
  }
  Widget active(){
    if(i%2==0){
      return Text("active",style: TextStyle(color: Colors.green),);
    }else
    {
      return Text("inactive",style: TextStyle(color: Colors.red),);
    }
  }
  // Widget msg=const Icon(Icons.chat_bubble);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
          horizontalTitleGap: 15,
          leading: check(),
          title: Text(name),
          subtitle: Text("you hava a message"),
          trailing: active(),
          tileColor: Colors.orange[50],
          contentPadding: EdgeInsets.all(10),
          
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
    );
  }
}

class CircleAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: Text("active"),
     
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtqWcM_dpnovHf3j5mCzWgWgfcsKW6OD_jig&usqp=CAU"),
            fit: BoxFit.cover,
          )),
    );
  }
}

class SquareAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
       child: Text("inactive"),
      decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtqWcM_dpnovHf3j5mCzWgWgfcsKW6OD_jig&usqp=CAU"),
            fit: BoxFit.cover,
          )),
    );
  }
}
