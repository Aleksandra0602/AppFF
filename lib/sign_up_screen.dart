import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projekt1/before_picture_screen.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {



  String dropdownValue = 'Amber';
  var eyes = [
    'Amber',
    'Blue',
    'Green',
    'Grey',
    'Hazel',
    'Brown',
    'Black',
    'Two diffrent color'
  ];
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _emailController= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                child: Image.asset(
              'assets/images/AppFF.png',
              height: 170,
              width: 170,
            )),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: _loginController,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  labelText: 'Login *',
                  labelStyle: TextStyle(color: Colors.pink),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink)),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  icon: Icon(Icons.alternate_email_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'E-mail *',
                  labelStyle: TextStyle(color: Colors.pink),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButtonFormField(
                style: TextStyle(color: Colors.pink, fontSize: 16),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: eyes.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                    icon: Icon(Icons.remove_red_eye_outlined),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink)),
                    labelStyle: TextStyle(color: Colors.black45)),
              ),
            ),
            SizedBox(height: 40),
            InkWell(
              onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BeforePictureScreen(
                            login: _loginController.text,
                            mail: _emailController.text,
                            eyes: dropdownValue
                          )));
              },
              child: Container(
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Icon(
                    Icons.double_arrow,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
