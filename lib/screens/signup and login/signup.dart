import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../widgets/reusablewidgets.dart';
import '../signup and login/login.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _email =TextEditingController();
  TextEditingController _password= TextEditingController();
  
  TextEditingController _confirmpassword= TextEditingController();


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      body: Form(

       key: _formKey,
        child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          
          children: <Widget>[
            SizedBox(height: 20,),
              Column(
                  children: [
                    Text ("Create an account", style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
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
                        },//save input
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
                     controller: _password,
                      autofocus: true,
                      cursorColor: Colors.black,
                      style:  textInputDecoration.inputTextStyle(),
                      obscureText: true,
                      enableSuggestions: !true,
                      autocorrect: !true,
                       onSaved: (val) {
                          print('saved');
                        },//save input
                      decoration:
                          textInputDecoration.textInputDesign("Enter Password ",Icons.lock_outline,_password),
                                      
                    //input fields validation for email 
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

                                        SizedBox(
                                                height: 30,
                                              ),

                          //input field fofr confirm password
                            TextFormField(
                      controller: _confirmpassword,
                      autofocus: true,
                      cursorColor: Colors.black,
                      style:  textInputDecoration.inputTextStyle(),
                      obscureText: true,
                      enableSuggestions: !true,
                      autocorrect: !true,
                       onSaved: (val) {
                          print('saved');
                        },//save input
                      decoration:
                          textInputDecoration.textInputDesign("Confirm Password ",Icons.lock_outline,_confirmpassword),
                           
                    //input fields validation for confirm password 
                    validator: (value) {
                      //check if felds are empty 
                                        if (value!.isEmpty) {
                            return "Please confirm your password";
                          }
                          
                                if(_password.text != _confirmpassword.text){
                                    return 'Confirm password not matching';
                                  }
                                             return null;

                                                },),
                
           
                                            SizedBox(
                                            height: 20,
                                          ),
           
                  SizedBox(height: 20.0),

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
                 
                  //directs to the homescreen only when account is created 
                    FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email.text ,
                     password: _password.text).then((value){
                            //  display a snackbar for successfull registration
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Signup succesfully'),
                                            backgroundColor: Colors.green),);
                                      
                       Navigator.push(context,
                        MaterialPageRoute(builder: (context) => loginScreen()));

                     }).onError((error, stackTrace) {
                //  display a snackbar for if error occurs 
                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Something went wrong with registration'),
                                            backgroundColor: Colors.red),
                                      );
                     });
          
                  
            }},
           child: Text(
                                "Signup",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w800),
                              ),),
            
                        
                                 
          
          ],
        ),
      ),
    );
  }
}