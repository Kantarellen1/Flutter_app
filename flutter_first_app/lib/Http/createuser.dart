import 'package:http/http.dart' as http;
import 'package:flutter_intro/models/user.dart';
import 'dart:convert';


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