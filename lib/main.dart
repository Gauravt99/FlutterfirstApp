import 'package:flutter/material.dart';
import 'package:project2/floating_tab_bar_page_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FloatingTabBarPageView(),
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
    );
  }
}
