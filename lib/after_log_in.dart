import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;


import 'finger_screen.dart';
import 'package:image_picker/image_picker.dart';

class AfterLogIn extends StatefulWidget {
  const AfterLogIn({Key? key}) : super(key: key);

  @override
  State<AfterLogIn> createState() => _AfterLogIn();
}

class _AfterLogIn extends State<AfterLogIn> {
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FingerScreen()));
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

