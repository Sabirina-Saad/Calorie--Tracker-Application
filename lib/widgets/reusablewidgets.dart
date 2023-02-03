import 'package:flutter/material.dart';


import 'package:flutter/material.dart';

class textInputDecoration extends InputDecoration {
 
  static textInputDesign(String text,IconData icontype , TextEditingController controller) {
    return InputDecoration(
//input form decoration 
/*
    autofocus: true,
    controller: controller,
    cursorColor: Colors.black,
    style: TextStyle(fontSize: 19,color: Colors.black.withOpacity(0.6),decoration: TextDecoration.none),
    obscureText: ispswdtype,
    enableSuggestions: !ispswdtype,
    autocorrect: !ispswdtype,
    decoration: InputDecoration(*/
      prefixIcon: Icon(icontype,color:Colors.grey[40]),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),borderSide: const BorderSide(width:0,style:BorderStyle.none)),
     filled: true,
   fillColor: Colors.grey.withOpacity(0.1),
   labelText:text, 
    labelStyle:TextStyle(color: Colors.black38),
    hintStyle: TextStyle(letterSpacing: 1.2, color: Colors.black.withOpacity(0.6)),);
  }
//textstyle 
 static TextStyle inputTextStyle() {
    return TextStyle(
    fontSize: 19,
    color: Colors.black.withOpacity(0.6),
    decoration: TextDecoration.none,
    );
  }
}

