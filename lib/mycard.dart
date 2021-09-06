import 'package:flutter/material.dart';

void main() {
  runApp(MyCard());
}

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.tealAccent,

        // appBar: AppBar(),
        body: SafeArea(
            child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 180, left: 25),
                child: CircleAvatar(
                  radius: 65.0,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 25),
                child: Text(
                  'Gaurav Tak',
                  style: TextStyle(
                      color: Colors.black, fontSize: 27, fontFamily: 'Lobster'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 14, left: 20),
                child: Text(
                  'FLUTTER DEVELOPER',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontFamily: 'SourceCodePro',
                      letterSpacing: 2.5),
                ),
              ),
              SizedBox(
                  height: 20,
                  width: 300,
                  child: Divider(
                    color: Colors.black,
                  )),
              Card(
                color: Colors.white,
                //padding: EdgeInsets.all(11),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal,
                      size: 40,
                    ),
                    title: Text(
                      '9075574208',
                      style: TextStyle(
                          fontFamily: 'SourceCodePro',
                          fontSize: 20,
                          color: Colors.tealAccent),
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                //padding: EdgeInsets.all(11),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal,
                      size: 40,
                    ),
                    title: Text(
                      'gauravtak@gmail.com',
                      style: TextStyle(
                          fontFamily: 'SourceCodePro',
                          fontSize: 20,
                          color: Colors.tealAccent),
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
