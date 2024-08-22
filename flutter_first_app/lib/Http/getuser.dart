import 'dart:convert';
import 'dart:io';
import 'package:flutter_first_app/models/user.dart';
import 'package:http/http.dart' as http;

// hent bruger
Future<User>fetchuser() async{
  final response = await http.get(Uri.parse('server=mysql9.dandomain.dk;database=saaapidk_db;user=saaapidk;password=HarmonyEventPW_140824;'),
  headers:{
HttpHeaders.authorizationHeader: '',
  
  },
  );
  if (response.statusCode==200){
    return User.fromJson(jsonDecode(response.body)as Map<String, dynamic>);

  }else{
    throw Exception('failed');
  }
}
// lav bruger 

Future<User> createUser(String title) async {
  final response = await http.post(
    Uri.parse('server=mysql9.dandomain.dk;database=saaapidk_db;user=saaapidk;password=HarmonyEventPW_140824;'),  
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );
  if (response.statusCode==201){
    return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

  }
  else {
    throw Exception('failed create');
  
}
}