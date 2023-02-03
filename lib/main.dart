import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/signup and login/login.dart';
import 'screens/signup and login/signup.dart';

void main() async{ 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch:Colors.green,
            fontFamily: "RalewatMedium",
      ),
       debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Calorie tracker app '),
     
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           
                    Stack(
                    children: <Widget>[
                      Container(
                    width: 250,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(300.0),
                          child: Image.asset("assets/images/counterlogo.png"),
                          
                          
                        ),
                      ),
                    ],
                  ),
           SizedBox(
            height: 20.0,
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  ("Welcome To Calorie Tracker ").toUpperCase(),
                  style: const TextStyle(fontSize: 20.0,fontWeight: FontWeight.w800),
                ),
              
                 SizedBox(height: 55.0),
          
          ElevatedButton(
             style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff333333),
          padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 16.0),
           minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          )),
        onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => loginScreen()));
                  },
           child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w800),
                              ),),
                 SizedBox(height: 25.0),

            ElevatedButton(
             style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff3DB963),
          
          padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 16.0),
           minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          )),
            onPressed: () {
               Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignupScreen()));
                  
            },
           child: Text(
                                "Signup",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w800),
                              ),),
          
              ],
            ),
          ),

            
                          
          ],
        ),
      ),
        // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
