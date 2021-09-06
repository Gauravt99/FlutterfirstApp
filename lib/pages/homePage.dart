import 'package:flutter/material.dart';
import 'package:project2/pages/addData.dart';
import 'package:project2/pages/listPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Firebase CRUD",
              style: TextStyle(),
            ),
            ElevatedButton(
              onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => AddData()))},
              child: Text('Add'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                      //to set border radius to button
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(9)),
            )
          ],
        ),
      ),
      body: ListPage(),
      drawer: Drawer(),
    );
  }
}
