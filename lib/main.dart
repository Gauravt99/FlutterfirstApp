import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project2/diceapp.dart';
import 'package:project2/floating_tab_bar_page_view.dart';
import 'package:project2/pages/homePage.dart';
import 'package:project2/mycard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: unused_field
  // initializing firebase
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // checking firebase errors
        if (snapshot.hasError) {
          print('Something went wrong');
        }

        // if connection is successful then it returns following

        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
        }

        return CircularProgressIndicator();
      },
    );
  }
}


// MaterialApp(
            // debugShowCheckedModeBanner: false,
            //home: DiceApp(),
            // home: HomePage(),
            //home: FloatingTabBarPageView(),
            // home: Scaffold(
            //   backgroundColor: Colors.white,
            //   body: Column(
            //     children: [
            //       Card(
            //         child: Container(
            //           height: 100,
            //           width: 100,
            //           margin: EdgeInsets.only(top: 50, left: 50),
            //           color: Colors.red,
            //           child: Padding(
            //               padding: EdgeInsets.only(top: 40, left: 33),
            //               child: Text("hello")),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          // );


  // FutureBuilder(
  //     future: _initialization,
  //     builder: (context, snapshot) {
  //       // CHeck for Errors
  //       if (snapshot.hasError) {
  //         print("Something went Wrong");
  //       }
  //       // once Completed, show your application
  //       if (snapshot.connectionState == ConnectionState.done) {
  //         return MaterialApp(
  //           title: 'Flutter Firestore CRUD',
  //           theme: ThemeData(
  //             primarySwatch: Colors.deepPurple,
  //           ),
  //           debugShowCheckedModeBanner: false,
  //           home: HomePage(),
  //         );
  //       }
  //       return CircularProgressIndicator();
  //     },
  //   );