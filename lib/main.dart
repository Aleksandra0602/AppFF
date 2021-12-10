import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('AppFF'),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
              iconSize: 24,
              onPressed: null,
            ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 250,
              child: Image.asset('assets/images/AppFF.png', fit: BoxFit.cover),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                  onPrimary: Colors.white,
                  minimumSize: Size.fromHeight(50),
                  maximumSize: Size.fromHeight(75),
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
                child: Text('Log in!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: OutlinedButton(
                onPressed: () {},
                child: Text(
                  'Sign up!',
                ),
                style: OutlinedButton.styleFrom(
                  primary: Colors.pink,
                  minimumSize: Size.fromHeight(50),
                  maximumSize: Size.fromHeight(75),
                  side: BorderSide(
                      width: 3, color: Colors.pink, style: BorderStyle.solid),
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
