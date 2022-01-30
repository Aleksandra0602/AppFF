import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:projekt1/models/login_response_model.dart';

class ResultScreen extends StatefulWidget {
 const ResultScreen({Key? key, required this.dataUser}) : super(key: key);
 final LoginResponseModel dataUser;

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late Uint8List bytes;
  @override
  void initState() {
    bytes = base64Decode(widget.dataUser.photoBase!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          child: const Text(
              'Log out',
          style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: Colors.white)),
          onPressed: () {
            SystemNavigator.pop();
          },
        ),
        title: const Text('Result'),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                width: 200,
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black)
                ),
                child: Image.memory(bytes),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(25),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                    ),
                    child: const Text(
                      'Login : ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(25),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54)
                    ),
                    child: Text(
                      widget.dataUser.login!,

                      style: const TextStyle(
                        fontSize: 22,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(25),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)
                    ),
                    child: const Text(
                      'E-mail :',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(25),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54)
                    ),
                    child: Text(
                      widget.dataUser.mail!,

                      style: const TextStyle(
                        fontSize: 22,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(25),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)
                    ),
                    child: const Text(
                      'Eyes color :',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(25),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54)
                    ),
                    child: Text(
                     widget.dataUser.eyes!,

                      style: const TextStyle(
                        fontSize: 22,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: OutlinedButton(
                    onPressed: () {
                      SystemNavigator.pop();
                    } ,
                    child: const Text(
                      'Log out'
                    ),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.pink,
                    minimumSize: const Size.fromHeight(50),
                    maximumSize: const Size.fromHeight(75),
                      side: const BorderSide(
                      width: 3, color: Colors.pink, style: BorderStyle.solid),
                  textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
