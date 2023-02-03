import 'package:calrie_tracker_app/screens/dashboard_screen.dart';
import 'package:calrie_tracker_app/screens/diary_screen.dart';
import 'package:calrie_tracker_app/screens/plans_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../constants/constants.dart';
import 'activity.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pages = [
     DashboardScreen(),
     DiaryScreen(),
     activityScreen(),
     PlansScreen(),
  ];

  int currentindex = 0;
  void onTap(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],
      bottomNavigationBar: Container(
        height: 80.0,
        color: kLite,
        padding: const EdgeInsets.only(top: 10.0),
        child: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: kTeal,
              bottomAppBarColor: kTeal,
              textTheme: Theme.of(context).textTheme.copyWith(
                  caption: const TextStyle(
                      color: kLite))), // sets the inactive color of the `BottomNavigationBar`
          child: BottomNavigationBar(
              onTap: onTap,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              elevation: 1,
              currentIndex: currentindex,
              selectedItemColor: kCircleProgressColor,
              unselectedItemColor: kLite,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      MaterialCommunityIcons.view_dashboard,
                      size: 28,
                    ),
                    label: 'Dashboard',
                    backgroundColor: kDark),
                BottomNavigationBarItem(
                  icon: Icon(
                    Ionicons.book,
                    size: 28,
                  ),
                  label: 'Diary',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    MaterialIcons.directions_run,
                    size: 28,
                  ),
                  label: 'Activity',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Foundation.clipboard_notes,
                    size: 28,
                  ),
                  label: 'Plans',
                ),
              
              ]
              ),
        ),
      ),
    );
  }
}
