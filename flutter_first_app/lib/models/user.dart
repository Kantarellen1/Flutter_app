import 'package:flutter/material.dart';

class User {
  final int id;
  final String email;
  final String Username;

  const User({
    required this.id,
    required this.email,
    required this.Username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {  
        'id': int id,
        'email': String email,
        'Username': String Username,
      } =>
        User(
          id: id,
        email: email,
      Username:  Username,
        ),
      _ => throw const FormatException('Failed to load User.'),
    };
  }

}