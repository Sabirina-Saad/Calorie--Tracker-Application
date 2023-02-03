// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../constants/constants.dart';
import 'activity.dart';
import 'diary_screen.dart';
import 'profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Icon(Ionicons.ios_notifications),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: TextFormField(
                  // controller: controller,
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
                    labelText: 'Search',
                    labelStyle: TextStyle(
                      color: kLite,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            CircleAvatar(
              child: InkWell(child:  Icon(Icons.person),onTap: (){
                Navigator.push(context,
                 MaterialPageRoute(builder: (context) =>  ProfileScreen(),));
              },),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),

        //body

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: kTeal,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: CircularPercentIndicator(
                      radius: 80.0,
                      animation: true,
                      animationDuration: 1200,
                      lineWidth: 12.0,
                      percent: 0.2,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "1200",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0,
                                color: kLite),
                          ),
                          Text(
                            "Remain",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16.0,
                                color: kLite),
                          ),
                        ],
                      ),
                      circularStrokeCap: CircularStrokeCap.butt,
                      backgroundColor: kLite,
                      progressColor: kCircleProgressColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                    height: 250,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: kTeal,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Steps',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20, color: kLite),
                                ),
                                Icon(
                                  MaterialCommunityIcons.run,
                                  size: 70,
                                  color: kLite,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                 MaterialPageRoute(builder: (context) =>  activityScreen(),));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kLite,
                                  ),
                                  child: Text('Track Steps',style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 14, color: kDark), ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: kTeal,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Calories',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20, color: kLite),
                                ),
                                Icon(
                                  MaterialIcons.food_bank,
                                  size: 70,
                                  color: kLite,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    
                                    Navigator.push(context,
                                 MaterialPageRoute(builder: (context) =>  DiaryScreen(),));
                                    
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kLite,
                                  ),
                                  child: Text('Add Calories',style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 14, color: kDark), ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
