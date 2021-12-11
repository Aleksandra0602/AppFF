import 'package:flutter/material.dart';
import 'constants/dimensions.dart';
import 'log_in_screen.dart';
class AfterRegistration extends StatelessWidget {
  const AfterRegistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppFF'),
        backgroundColor: Colors.pink,
        centerTitle: true,  
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: Dimensions.BIG_PADDING),
            Container(
              // padding: EdgeInsets.all(35),
              child: const Text(
                'You have been added to the application!',
                style:  TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: 250,
              child: Image.asset('assets/images/check.png', fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogInScreen()),
                  );
                },
                child: const Text('Log in!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
