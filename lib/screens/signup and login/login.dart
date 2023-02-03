import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../../widgets/reusablewidgets.dart';
import '../home_screen.dart';


class loginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
    
}

class _loginScreenState extends State<loginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _email =TextEditingController();
  TextEditingController _password= TextEditingController();

Future signin() async{
      try{
                    await  FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email.text ,
                     password: _password.text);
                     
                         }on FirebaseAuthException catch(e){
                          ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Invalid Username or Password'),
                                        backgroundColor: Colors.red),
                  );
                         }
}
  @override
  Widget build(BuildContext context) {
    //check is user is loged into system or not
    StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:(context, snapshot) {
          if(snapshot.hasData){
          return HomeScreen();}
          else{
            return loginScreen();
          }
        },);
    return Scaffold(
     
        resizeToAvoidBottomInset: false,
      body: Form(

       key: _formKey,
        child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          
          children: <Widget>[
            SizedBox(height: 30,),
              Column(
                  children: [
                    Text ("Login", style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 20,),
                    Text("Welcome back ! Login with your credentials",style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),),
                    SizedBox(height: 60,),
                  ],
                ),
                TextFormField(
                  controller: _email,
                      autofocus: true,
                      cursorColor: Colors.black,
                      style:  textInputDecoration.inputTextStyle(),
                      obscureText: false,
                      enableSuggestions: !false,
                      autocorrect: !false,
                      onSaved: (val) {
                            print('saved');
                          },
                      decoration:
                          textInputDecoration.textInputDesign("Enter email ",Icons.person_outline,_email),
                                      
                    //input fields validation for email 
                    validator: (value) {
                      //check if felds are empty 
                                        if (value!.isEmpty) {
                            return "Please enter your email";
                          }
                          //checks if email is valid or not
                              if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
                                  return  'Please enter a valid email';
                                            }
                                             return null;

                                                },),
                                                 SizedBox(
                                                height: 30,
                                              ),

                            //input field for passsword
                            TextFormField(
                       controller : _password,
                      autofocus: true,
                      cursorColor: Colors.black,
                      style:  textInputDecoration.inputTextStyle(),
                      obscureText: true,
                      enableSuggestions: !true,
                      autocorrect: !true,
                      onSaved: (val) {
                          print('saved');
                        },//saves the inputs 
                      decoration:
                          textInputDecoration.textInputDesign("Enter Password ",Icons.lock_outline,_password),
                                      
                    //input fields validation for password
                    validator: (value) {
                      //check if felds are empty 
                                        if (value!.isEmpty) {
                            return "Please enter your password";
                          }
                          //checks if password contains 8 characters 
                                if (value.length < 8) {
                                  return  'Password must be at least 8 characters';
                                }
                                             return null;

                                                },),
                
           
                    SizedBox(height: 25.0),

            ElevatedButton(
             style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo[500],
          padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 16.0),
           minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          )),
            onPressed: () {
             
            // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                         //login authentication for user credentials 
                   
                    FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text ,
                     password: _password.text).then((value){
                       //  display a snackbar for successful login
                 ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login successfully'),
                                        backgroundColor: Colors.green),
                  );
                       Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));

                     }).onError((error, stackTrace) {
                       //  display a snackbar for invalid user crendentials 
                 ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Invalid Username or Password'),
                                        backgroundColor: Colors.red),
                  );
                     });
                 
                  
            }},
           child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w800),
                              ),),
                   
                              

          
          ],
        ),
      ),
    );
  }
  
}