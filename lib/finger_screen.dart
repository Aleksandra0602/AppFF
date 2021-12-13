import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'constants/dimensions.dart';

class FingerScreen extends StatelessWidget {
  const FingerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text('AppFF'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget> [
              Text("Finger prints",
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
              ),
                textAlign: TextAlign.center,
              ),
              Container(
                child: Image.asset(
                  'assets/images/finger.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Text("Check", style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
