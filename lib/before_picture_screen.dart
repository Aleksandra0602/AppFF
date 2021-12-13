import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:path/path.dart';
import 'package:projekt1/after_registration.dart';

import 'finger_screen.dart';
import 'package:image_picker/image_picker.dart';

class BeforePictureScreen extends StatefulWidget {
  const BeforePictureScreen({Key? key}) : super(key: key);

  @override
  State<BeforePictureScreen> createState() => _BeforePictureScreenState();
}

class _BeforePictureScreenState extends State<BeforePictureScreen> {
  File? storedImage;

  Future <void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 600
    );
      setState(() {
        storedImage = File(imageFile!.path);
      });
    }

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
              Container(
                child: Text(
                  'Please take a photo!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
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
                    child: Center(
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
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AfterRegistration()));
                      },
                      child: Text('Send'),
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

