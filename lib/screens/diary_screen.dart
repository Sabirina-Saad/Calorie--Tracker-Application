import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../common/food_card.dart';
import '../constants/constants.dart';

class DiaryScreen extends StatelessWidget {
  DiaryScreen({Key? key}) : super(key: key);

  TextEditingController foodNameController = TextEditingController();
  TextEditingController foodCaloriesAmountController = TextEditingController();

  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth _user = FirebaseAuth.instance;

  void popUp(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Center(child: Text("Enter Food Details")),
            content: Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: foodNameController,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        focusedBorder: InputBorder.none,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                        ),
                        filled: true,
                        fillColor: kLite,
                        labelText: 'Food Name',
                        labelStyle: TextStyle(
                          color: kDark,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: foodCaloriesAmountController,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        focusedBorder: InputBorder.none,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                        ),
                        filled: true,
                        fillColor: kLite,
                        labelText: 'Calories Amount',
                        labelStyle: TextStyle(
                          color: kDark,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  child: Center(
                    child: ElevatedButton(
                      child: const Text("ADD"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[500],
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        

                        if (foodNameController.text != null &&
                            foodCaloriesAmountController.text != null) {
                          try {
                            _firebaseFirestore
                                .collection('users')
                                //.doc(_user.currentUser!.uid)
                                .doc('122')
                                .collection('diary')
                                .doc('morning')
                                .set({
                              'foodNameController': foodNameController.text,
                              'foodCaloriesAmountController':
                                  foodCaloriesAmountController.text,
                            });
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString())));
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Enter all the fields')));
                        }

                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diary'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _firebaseFirestore
              .collection('users')
              //.doc(_user.currentUser!.uid)
              .doc('122')
              .collection('diary')
              .snapshots(),
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,
          ) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            final data = snapshot.requireData;

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            'Today ${data.docs.length}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: kDark),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Card(
                            color: kTeal,
                            elevation: 2,
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Calories Remaining',
                                    style: TextStyle(
                                        color: kLite,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      height: 150,
                                      width: double.infinity,
                                      child: Expanded(
                                        child: FittedBox(
                                          child: DataTable(
                                            border: TableBorder.all(
                                              width: 1,
                                              color: kLite,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            columns: const <DataColumn>[
                                              DataColumn(
                                                  label: Expanded(
                                                      child: Text(
                                                'Goal',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ))),
                                              DataColumn(
                                                  label: Expanded(
                                                      child: Text(
                                                'Food',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ))),
                                              DataColumn(
                                                  label: Expanded(
                                                      child: Text(
                                                'Beverages',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ))),
                                              DataColumn(
                                                  label: Expanded(
                                                      child: Text(
                                                'Remain',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ))),
                                            ],
                                            rows: data.docs.map<DataRow>((e) {
                                              return DataRow(
                                                cells: <DataCell>[
                                                  const DataCell(SizedBox(
                                                    child: Text(
                                                      '1500 Cal',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        color: kLite,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  )),
                                                  const DataCell(
                                                    Center(
                                                      child: Text(
                                                        '0 Cal',
                                                        style: TextStyle(
                                                          color: kLite,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const DataCell(Center(
                                                      child: Text(
                                                        '0 Cal',
                                                        style: TextStyle(
                                                          color: kLite,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),)),
                                                  DataCell(Center(
                                                      child: InkWell(
                                                          onTap: () {},
                                                          child: const Text(
                                                        '0 Cal',
                                                        style: TextStyle(
                                                          color: kLite,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),))),
                                                ],
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      )),
                                ),

                                //add breackfast
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          //breackafst
                          FoodCard(
                            foodDetails: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Food',
                                  style: TextStyle(
                                      color: kLite,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                      color: kLite,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            mealName: 'Breackfast',
                            onPress: () {
                              popUp(context);
                            },
                            totalCaloriesAmount: 0,
                          ),

                          SizedBox(height: 10,),

                          //breackafst
                          FoodCard(
                            foodDetails: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Food',
                                  style: TextStyle(
                                      color: kLite,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                      color: kLite,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            mealName: 'Lunch',
                            onPress: () {
                              popUp(context);
                            },
                            totalCaloriesAmount: 0,
                          ),

                          SizedBox(height: 10,),


                          //breackafst
                          FoodCard(
                            foodDetails: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Food',
                                  style: TextStyle(
                                      color: kLite,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                      color: kLite,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            mealName: 'Dinner',
                            onPress: () {
                              popUp(context);
                            },
                            totalCaloriesAmount: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
