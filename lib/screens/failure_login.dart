import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projekt1/constants/dimensions.dart';
import 'package:projekt1/screens/log_in_screen.dart';

class FailureLogin extends StatelessWidget {
  const FailureLogin({Key? key}) : super(key: key);

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
            const SizedBox(
              height: Dimensions.BIG_PADDING,
            ),
            Container(
              child: const Text(
                'Access denied, something went wrong!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 250,
              child: const Icon(Icons.cancel_rounded, color: Colors.red,size: 120,)
            ),
            const Text(
              'You can try again or log out',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150,50),
                      textStyle: const TextStyle(fontSize: 20),
                      primary: Colors.pink,
                      onPrimary: Colors.white,
                    ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LogInScreen()),
                        );
                      },
                      child: const Text('Log in')
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: OutlinedButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: const Text('Log out'),
                    style: OutlinedButton.styleFrom(
                        minimumSize: Size(150,50),
                      textStyle: const TextStyle(fontSize: 20),
                      primary: Colors.pink,
                      side: const BorderSide(
                        width: 3,
                        color: Colors.pink,
                        style: BorderStyle.solid
                      )
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
