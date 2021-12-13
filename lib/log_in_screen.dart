import 'package:flutter/material.dart';
import 'package:projekt1/after_registration.dart';

import 'before_picture_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 50),
            Container(
              child: Image.asset('assets/images/AppFF.png', height: 200, width: 200,),
            ),
            const SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(10) ,
              padding: EdgeInsets.all(10),
              child: TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: 'Login *',
                          labelStyle: TextStyle(color: Colors.pink),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pink)),
                      ),
                validator: (String? value) {
                          return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                },
                ),
              ),
            const SizedBox(height: 60),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BeforePictureScreen()));
              },
              child: Container(
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Text(
                      "Check",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),

      );
  }
}
