import 'package:firebase_auth/firebase_auth.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pedometer/pedometer.dart';
import  'package:intl/intl.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'signup and login/login.dart';
import '../widgets/reusablewidgets.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

class activityScreen extends StatefulWidget {
  @override
  _activityScreenState createState() => _activityScreenState();
  
}

class _activityScreenState extends State<activityScreen> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
    late Pedometer _pedometer;
String status = 'Walking', steps = '0';
  String   time = DateFormat("hh:mm:ss a").format(DateTime.now());
   String date = DateFormat("EEEEE: dd:MM:yyyy").format(DateTime.now());


  @override
  void initState() {
    super.initState();
    initPlatformState();
  }
 
  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      steps = event.steps.toString();
    });
    
  }

  void onPedestrianStatusChanged(PedestrianStatus event) async{
    print(event);
    setState(() {
      status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
     status = 'Pedestrian Status not available';
    });
    print(status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      steps = 'Step Count not available';
    });
  }

 void change(){
    setState(() {
            steps = "0"; 
    },);
    print(steps);
  }
  
  Future<void> initPlatformState() async {
 if (await Permission.activityRecognition.request().isGranted) {
  _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
  _pedestrianStatusStream
      .listen(onPedestrianStatusChanged)
      .onError(onPedestrianStatusError);

  _stepCountStream = Pedometer.stepCountStream;
  _stepCountStream.listen(onStepCount).onError(onStepCountError);
}else{
  
}
if (!mounted) return;
  }
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title:  Text('Activity'),
        
       ),
      body: Center(
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                   Stack(
                    children: <Widget>[
                      Container(
                    width: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(300.0),
                          child: Image.asset("assets/images/walking.png"),
                          
                          
                        ),
                      ),
                    ],
                  ),

                const SizedBox(height: 20),
                
              Text(
                status,
                style: TextStyle(fontSize: 28.0,color: Colors.black),
                
              ),
              SizedBox(
                height: 6.0,
              ),
              Container(
                height: 2.0,
                width: 120.0,
                decoration: const BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.all(Radius.circular(4.0))),
              ),
               SizedBox(
                height: 5.0,
              ),
              Text(
                steps,
                style: TextStyle(fontSize: 25.0,color: Colors.black),
              ),
              Text(
                'STEPS',
                style: TextStyle(fontSize: 15.0,color: Colors.black),

              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                'GOAL - 8000',
                style: TextStyle(fontSize: 15.0,color: Colors.black),

              ),
              ElevatedButton(
                 style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff3DB963),),
                child: Text('Restart', style:TextStyle(fontSize: 15.0,color: Colors.black)),
                onPressed: change,
              ),
          const SizedBox(
                height: 30,
              ),
          
          Container(
    padding: const EdgeInsets.all(20),
    child:
               Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
           Image.asset("assets/images/footprint.png",  height: 25,
    width: 25,) ,
            const Text('Steps Taken'),
             Text(steps),
          ],
        ),
        Column(
          children: [
            Icon(Icons.date_range, color: Colors.blue[500]),
            const Text('Date'),
             Text("$date"),
          ],
        ),
        Column(
          children: [
            Icon(Icons.timelapse, color: Colors.black),
            const Text('Time'),
             Text("$time"),
          ],
        ),
      ],
    ),
  ),

            ],),), 
          );
  }
}