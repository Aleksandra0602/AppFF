import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projekt1/screens/sign_up_screen.dart';
import 'log_in_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.clear_rounded),
          onPressed: () {
            SystemNavigator.pop();
          },
        ),
        backgroundColor: Colors.pink,
        title: const Text('AppFF'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 250,
            child: Image.asset('assets/images/AppFF.png', fit: BoxFit.cover),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.pink,
                onPrimary: Colors.white,
                minimumSize: const Size.fromHeight(50),
                maximumSize: const Size.fromHeight(75),
                textStyle: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogInScreen()),
                );
              },
              child: const Text('Log in!'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              child: const Text(
                'Sign up!',
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
          ),
        ],
      ),
    );
  }
}
