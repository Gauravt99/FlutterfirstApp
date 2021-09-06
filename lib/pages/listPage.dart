import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project2/pages/updateData.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  // collecting data from firebase
  final Stream<QuerySnapshot> userDataStream = FirebaseFirestore.instance.collection('UserData').snapshots();

  // for deleting records from firebase
  CollectionReference userdata = FirebaseFirestore.instance.collection('UserData');

  // ignore: non_constant_identif ier_names
  // ignore: non_constant_identifier_names
  Future<void> DeleteData(id) {
    //  print('User deleted : $id');
    return userdata.doc(id).delete().then((value) => () {
          print('User Deleted');
        });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: userDataStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          // if snapshot has error
          if (snapshot.hasError) {
            print('Something went wrong');
          }

          // if connection is on waiting
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // adding data to a list

          // ignore: unused_local_variable
          final List storedata = [];

          // getting data as map
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedata.add(a);
            // print(a);

            a['id'] = document.id;
          }).toList();

          print(storedata);

          // if all are good

          return Container(
            margin: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Table(
                //defaultColumnWidth: FixedColumnWidth(140),
                border: TableBorder.all(width: 2, color: Colors.black, style: BorderStyle.solid),
                // columnWidths: const <int, TableColumnWidth>{1, FixedColumnWidth(140.0)},

                // alloting fixed width to particular columns
                columnWidths: {
                  0: FlexColumnWidth(3),
                  1: FlexColumnWidth(5),
                  2: FlexColumnWidth(3),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(children: [
                    TableCell(
                        child: Container(
                            color: Colors.greenAccent,
                            child: Center(
                              child: Text(
                                'Name',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ))),

                    TableCell(
                        child: Container(
                            color: Colors.greenAccent,
                            child: Center(
                              child: Text(
                                'Email',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ))),

                    TableCell(
                        child: Container(
                            color: Colors.greenAccent,
                            child: Center(
                              child: Text(
                                'Action',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ))),
                    //  Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
                    // Column(children: [Text('Name', style: TextStyle(fontSize: 18))]),
                    // Column(children: [Text('Email', style: TextStyle(fontSize: 18))]),
                    // Column(children: [Text('Action', style: TextStyle(fontSize: 18))]),
                  ]),
                  for (var i = 0; i < storedata.length; i++) ...[
                    TableRow(children: [
                      Column(children: [Text(storedata[i]['Name'])]),
                      Column(children: [Text(storedata[i]['Email'])]),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.orange,
                                  ),
                                  onPressed: () =>
                                      {Navigator.push(context, MaterialPageRoute(builder: (context) => 
                                      UpdateData(id:storedata[i]['id']))
                                      )
                                      }
                                      ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () => DeleteData(storedata[i]['id']),
                              )
                            ],
                          )
                        ],
                      ),
                    ]),
                  ]
                ],
              ),
            ),
          );
        });
  }
}
