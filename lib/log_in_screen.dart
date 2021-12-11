import 'package:flutter/material.dart';
import 'package:projekt1/after_registration.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(10) ,
        padding: EdgeInsets.all(10),
        child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Login',
                  labelStyle: TextStyle(color: Colors.pink),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pink)),
              ),

            ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        elevation: 5,
        icon: const Icon(Icons.arrow_forward_outlined, size: 30.0 ,),
        label: const Text('Check', style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
        ),
        ),
        backgroundColor: Colors.grey,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AfterRegistration())          
          );
        },
      ),
      );
  }
}
