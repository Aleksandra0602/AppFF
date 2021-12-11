import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String dropdownValue = 'Amber';
  var eyes = [
    'Amber',
    'Blue',
    'Green',
    'Grey',
    'Hazel',
    'Brown',
    'Black',
    'Two diffrent color'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Login',
                labelStyle: TextStyle(color: Colors.pink),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink)),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'E-mail',
                labelStyle: TextStyle(color: Colors.pink),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: DropdownButtonFormField(
              style: TextStyle(color: Colors.pink, fontSize: 16),
              onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
              items: eyes.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink)),
                  labelStyle: TextStyle(color: Colors.black45)) ,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: FormField<String>(
          //     builder: (FormFieldState<String> state) {
          //       return InputDecorator(
          //         decoration: InputDecoration(
          //             border: OutlineInputBorder(),
          //             focusedBorder: OutlineInputBorder(
          //                 borderSide: BorderSide(color: Colors.pink)),
          //             labelStyle: TextStyle(color: Colors.black45)),
          //         child: DropdownButtonHideUnderline(
          //           child: DropdownButton<String>(
          //             elevation: 10,
          //             style: TextStyle(color: Colors.pink, fontSize: 16),
          //             value: dropdownValue,
          //             onChanged: (String? newValue) {
          //               setState(() {
          //                 dropdownValue = newValue!;
          //                 state.didChange(newValue);
          //               });
          //             },
          //             items: eyes.map((String value) {
          //               return DropdownMenuItem<String>(
          //                 value: value,
          //                 child: Text(value),
          //               );
          //             }).toList(),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.grey,
        child: const Icon(Icons.double_arrow, size: 30.0),
      ),
    );
  }
}
