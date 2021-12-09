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
          ),
          body: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.pink,
                    minimumSize: Size.fromHeight(50),
                    maximumSize: Size.fromHeight(75),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Log in!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink,
                      minimumSize: Size.fromHeight(50),
                      maximumSize: Size.fromHeight(75),
                    ),
                    onPressed: () {},
                    child: Text('Sign up!',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
              )
            ],
          )),
    );
  }
}
