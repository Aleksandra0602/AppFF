import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:projekt1/screens/after_log_in.dart';
import 'package:projekt1/screens/failure_login.dart';
import 'package:projekt1/screens/result_screen.dart';
import '../constants/dimensions.dart';

class FingerScreen extends StatefulWidget {
  final String loginCheck;
  const FingerScreen({Key? key, required this.loginCheck}) : super(key: key);

  @override
  State<FingerScreen> createState() => _FingerScreenState();
}

class _FingerScreenState extends State<FingerScreen> {

  LocalAuthentication authentication = LocalAuthentication();
  // late bool _canCheck;
  late List<BiometricType> biometrics;
  String _authorized = "Not authorized";



  Future <void> _checkFingerPrints() async {

    bool auth = false;
    try {
     auth = await authentication.authenticateWithBiometrics(
         localizedReason: 'Scan your fingerprint to authenticate',
         // stickyAuth: true,
         useErrorDialogs: true,
         stickyAuth: false,
     );
    } on PlatformException catch (e){
      print(e);
    }

    setState(() {
      _authorized = auth ? 'Authorized' : 'Not authorized';
    });
    if(auth) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => AfterLogIn(
          login: widget.loginCheck,
        ))
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text('AppFF'),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget> [
                const Text("Clik \"Check\" and scan your fingerprint",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                ),
                  textAlign: TextAlign.center,
                ),
                Image.asset(
                  'assets/images/finger.png',
                  fit: BoxFit.cover,
                ),
                Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Center(
                    child: TextButton(
                        onPressed: () {
                          _checkFingerPrints();
                        },
                        child: const Text("Check", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                  ),
                ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
