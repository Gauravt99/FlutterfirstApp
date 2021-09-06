import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateData extends StatefulWidget {
  final String id;
  const UpdateData({Key? key, required this.id}) : super(key: key);

  @override
  _UpdateDataState createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  final _formKey = GlobalKey<FormState>();

  // for updating records from firebase
  CollectionReference userdata = FirebaseFirestore.instance.collection('UserData');

  Future<void> updateData(id, name, email, password) {
    print('data updated');
    return userdata
        .doc(id)
        .update({'Name': name, 'Email': email, 'Password': password}).then((value) => 'user updated');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Update Data'),
      ),
      body: Form(
        key: _formKey,
        child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(

            // getting specific data from firebase by id
            future: FirebaseFirestore.instance.collection('UserData').doc(widget.id).get(),
            builder: (_, snapshot) {
              if (snapshot.hasError) {
                print('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              // getting data from snapshot and store into local variable

              var data = snapshot.data!.data();

              var name = data!['Name'];
              var email = data['Email'];
              var password = data['Password'];

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: ListView(
                  children: [
                    // first textformfield

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        autofocus: false,
                        initialValue: name,
                        onChanged: (value) => {name = value},
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(fontSize: 16),
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                        // controller to control the textfield value / for getting value
                        //  controller: nameController,
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
                        initialValue: email,
                        onChanged: (value) => {email = value},
                        decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(fontSize: 16),
                            border: OutlineInputBorder(),
                            errorStyle: TextStyle(color: Colors.red, fontSize: 16)),
                        //     controller: emailController,
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
                        obscureText: true,

                        initialValue: password,
                        onChanged: (value) => {password = value},
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(fontSize: 16),
                            border: OutlineInputBorder(),
                            errorStyle: TextStyle(color: Colors.red, fontSize: 16)),
                        //   controller: passwordController,
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
                                  Future.delayed(Duration(seconds: 15));
                                  updateData(widget.id, name, email, password);

                                  // to redirect to previous page
                                  Navigator.pop(context);
                                }
                              },
                              child: Text(
                                'Update  Data',
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              )),

                          // Reset button

                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 5,
                                primary: Colors.deepOrangeAccent,
                              ),
                              onPressed: () {
                                //clearText();
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
              );
            }),
      ),
    );
  }
}
