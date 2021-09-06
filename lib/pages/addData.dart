import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  var name = '';
  var email = '';
  var password = '';

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  // for adding records from firebase
  CollectionReference userdata = FirebaseFirestore.instance.collection('UserData');

  @override
  // ignore: must_call_super
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  clearText() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  Future<void> addtoDB() {
    print('Added to DB');
    return userdata.add({'Name': name, 'Email': email, 'password': password}).then((value) => print("New User Added"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Add New Data'),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: ListView(
              children: [
                // first textformfield

                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(fontSize: 16),
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                    // controller to control the textfield value / for getting value
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                  ),
                ),

                // second textformfield
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  child: TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(),
                        errorStyle: TextStyle(color: Colors.red, fontSize: 16)),
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Email';
                      } else if (!value.contains('@')) {
                        return 'Please Enter Valid Email';
                      }
                      return null;
                    },
                  ),
                ),

                // third textformfield start
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  child: TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(),
                        errorStyle: TextStyle(color: Colors.red, fontSize: 16)),
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                  ),
                ),

                // Add & Reset buttons

                Container(
                  margin: EdgeInsets.symmetric(vertical: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Add Data Button
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            primary: Colors.greenAccent,
                          ),
                          onPressed: () {
                            // method to add data to db
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                name = nameController.text;
                                password = passwordController.text;
                                email = emailController.text;

                                addtoDB();
                                clearText();
                              });
                            }
                          },
                          child: Text(
                            'Add Data',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),

                      // Reset button

                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            primary: Colors.deepOrangeAccent,
                          ),
                          onPressed: () {
                            clearText();
                          },
                          child: Text(
                            'Reset Data',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ))
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
