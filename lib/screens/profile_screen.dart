import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'signup and login/login.dart';

    //final uemail = user.email;
   User? id = FirebaseAuth.instance.currentUser;
  
  String? email = id?.email; // <-- Their email

class ProfileScreen extends StatelessWidget {
const ProfileScreen({ Key? key }) : super(key: key);


    
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              child:  Icon(Icons.person),
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$email', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),),
              ],
            ),
          ],
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.settings),
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text('Name : ', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),),
            SizedBox(height: 10,),
            Text('Gender : ', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),),
            SizedBox(height: 10,),
            Text('Age : ', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),),
            SizedBox(height: 10,),
            Text('Weight : ', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),),
            SizedBox(height: 10,),
            Text('Height : ', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),),
            SizedBox(height: 50,),


            ElevatedButton(onPressed: (){
               FirebaseAuth.instance.signOut();
            print("Signout");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => loginScreen()));
            }, child: Text('Log Out')),
          ],
        ),
      ),
    );
  }
}