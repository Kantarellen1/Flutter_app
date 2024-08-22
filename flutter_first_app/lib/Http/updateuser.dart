import 'package:http/http.dart' as http;
import 'package:flutter_intro/models/user.dart';
import 'dart:convert';


Future<User> updateuser(String title) {
  return http.put(Uri.parse("her skal connectionstring være"),
  headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );
}