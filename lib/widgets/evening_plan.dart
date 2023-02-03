import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../constants/constants.dart';

class EveningPlan extends StatefulWidget {
  const EveningPlan({Key? key}) : super(key: key);

  @override
  _EveningPlanState createState() => _EveningPlanState();
}

class _EveningPlanState extends State<EveningPlan> {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  FirebaseAuth _user = FirebaseAuth.instance;
  TextEditingController morningPlanController = TextEditingController();

  String? textMessage = ' Write your text here';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            //.doc(_user.currentUser!.uid)
            .doc('122')
            .collection('plans')
            .doc('evening')
            .snapshots(),
        builder: (
          BuildContext context,
          AsyncSnapshot snapshot,
        ) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final data = snapshot.requireData;

          try{
            textMessage = data['eveningPlan'];
          }catch(e){
            
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4.0)),
                            border: Border.all(color: kCircleProgressColor, width: 2)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              decoration: BoxDecoration(color: kCircleProgressColor),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Evening Plan',
                                      style: TextStyle(color: kLite),
                                    ),
                                    GestureDetector(
                                      
                                        child: Container(child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Text('Save', style: TextStyle(color: kDark),),
                                        ), decoration: BoxDecoration(
                                          color: kLite,
                                          borderRadius: BorderRadius.circular(4)
                                          
                                        ),),
                                        onTap: () {
                                          try{
                                            _firebaseFirestore
                                              .collection('users')
                                              //.doc(_user.currentUser!.uid)
                                              .doc('122')
                                              .collection('plans')
                                              .doc('evening')
                                              .set({
                                            'eveningPlan':
                                                morningPlanController.text,
                                          });
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Updated Successfully'),backgroundColor: kCircleProgressColor,));
                                          } catch(e){
                                            
                                         
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                                          }

                                          
                                        }),
                                  ],
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: morningPlanController,
                              minLines: 2,
                              maxLines: 10,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                hintText: textMessage ,
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
