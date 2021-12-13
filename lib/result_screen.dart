import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          child: Text(
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
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(25),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                    ),
                    child: Text(
                      'Login : ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(25),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)
                    ),
                    child: Text(
                      'E-mail :',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),

                  )

                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(25),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)
                    ),
                    child: Text(
                      'Eyes color :',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
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
