// import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:projekt1/screens/after_registration.dart';
// import 'package:http/http.dart' as http;
import 'package:projekt1/utils/api_utils.dart';
// import 'finger_screen.dart';
import 'package:image_picker/image_picker.dart';

class BeforePictureScreen extends StatefulWidget {
  final String login;
  final String mail;
  final String eyes;
  const BeforePictureScreen({Key? key, required this.login, required this.mail, required this.eyes}) : super(key: key);

  @override
  State<BeforePictureScreen> createState() => _BeforePictureScreenState();
}

class _BeforePictureScreenState extends State<BeforePictureScreen> {
  File? storedImage;
  late File _pickedImage;


  Future <void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 600
    );
      setState(() {
        storedImage = File(imageFile!.path);
      });

      final appDir = await syspaths.getApplicationDocumentsDirectory(); //zapis do pliku
      final fileName  = path.basename(imageFile!.path);
      final savedImage = await storedImage!.copy('${appDir.path}/$fileName');
    }
    
  // Future<http.Response> registerUser() {
  //   final byt =  File(storedImage!.path).readAsBytesSync();
  //   return http.post(
  //     //Uri.parse('http://10.0.2.2:6060/user'),
  //     Uri.parse('http://130.61.242.176:6060/user'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'login': widget.login,
  //       'mail': widget.mail,
  //       'eyes' : widget.eyes,
  //       'photo_base' : base64Encode(byt)
  //     }),
  //   );
  // }



    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('AppFF'),
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Text(
                'Please take a photo!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                width: 200,
                height: 250,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.black),
                  ),
                child: storedImage == null
                    ? Image.asset(
                  'assets/images/Face.png',
                  fit: BoxFit.cover,
                )
                    : Image.file(
                  storedImage!,
                  fit: BoxFit.cover,
                ),

              ),
              Visibility(
                child: InkWell(
                  onTap: _takePicture,
                  child: Container(
                    width: 200,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Center(
                      child: Text("Check",
                          style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                visible: storedImage ==null ? true : false,
              ),
              Visibility(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50) ,
                        primary: Colors.pink,
                        onPrimary: Colors.white,
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      onPressed: () {
                        registerUser(storedImage, widget.login, widget.mail, widget.eyes);
                        //print(registerUser());
                        print("rejestracja : " + widget.login + " , " + widget.mail + " , " + widget.eyes);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AfterRegistration()));
                      },
                      child: const Text('Send'),
                    ),
                  ),
                  visible: storedImage !=null ? true : false,
              ),
            ],
          ),
        ),
      );
    }
  }

