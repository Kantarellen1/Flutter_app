import 'package:flutter/foundation.dart';
import 'package:flutter_first_app/models/user.dart';
import 'package:flutter_first_app/config/api_config.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http_parser/http_parser.dart'; 
import 'dart:typed_data'; 

class AuthService {
  final String baseUrl = ApiConfig.apiUrl;
  final storage = FlutterSecureStorage();

  Future<void> login(LoginDTO user) async {
    final url = Uri.parse('$baseUrl/api/Users/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      final token = jsonDecode(response.body)['token'];
      await storage.write(key: 'jwt', value: token);

      if (kDebugMode) {
        print('JWT Token: $token');
      }
    } else {
      throw Exception('Login failed');
    }
  }

  Future<void> register(String email, String username, String password,
      Uint8List? profilePictureData, String? fileName) async {
    final url = Uri.parse('$baseUrl/api/Users/signup');
    var request = http.MultipartRequest('POST', url);

    request.fields['Email'] = email;
    request.fields['Username'] = username;
    request.fields['Password'] = password;

    if (profilePictureData != null && fileName != null) {
      request.files.add(http.MultipartFile.fromBytes(
        'ProfilePicture',
        profilePictureData,
        filename: fileName,
        contentType:
            MediaType('image', 'jpeg'), 
      ));
    }

    final response = await request.send();

    if (response.statusCode == 200) {
      // Registration successful
      final responseBody = await response.stream.bytesToString();
      final token = jsonDecode(responseBody)['token'];
      await storage.write(key: 'jwt', value: token);

      if (kDebugMode) {
        print('Registration successful. JWT Token: $token');
      }
    } else {
      throw Exception('Registration failed: ${response.reasonPhrase}');
    }
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'jwt');
  }

  Future<void> logout() async {
    await storage.delete(key: 'jwt');
  }
}
