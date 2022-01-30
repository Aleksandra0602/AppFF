import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;


Future<http.Response> registerUser(File? storedImage, String login, String mail, String eyes) {
  final byt =  File(storedImage!.path).readAsBytesSync();
  return http.post(
    Uri.parse('http://10.0.0.100:6060/user'),
   // Uri.parse('http://130.61.242.176:6060/user'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'login': login,
      'mail': mail,
      'eyes' : eyes,
      'photo_base' : base64Encode(byt)
    }),
  );
}

Future<http.Response> loginUser(File? storedImage, String login) {
  final byt =  File(storedImage!.path).readAsBytesSync();
  final a = base64Encode(byt);
  return http.post(
    Uri.parse('http://10.0.0.100:6060/user/login'),
    //Uri.parse('http://130.61.242.176:6060/user/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'login': login,
      'photo_base' : base64Encode(byt)
    }),
  );
}
// Future<LoginResponseModel> getDataFromRepo(){
//   final response = http.get(
//     Uri.parse('http://10.0.0.100:6060/user/login'),
//   );
//   return LoginResponseModel.fromJson(jsonDecode(source));
// }

