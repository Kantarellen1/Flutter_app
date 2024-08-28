
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_first_app/models/event.dart';
import 'package:flutter_first_app/config/api_config.dart';




Future<void> createevent(EventDTO EventDTO) async {
  final String baseUrl = ApiConfig.apiUrl;
    final url = Uri.parse('$baseUrl/api/event/create');
 try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(EventDTO.toJson()),
      );

      if (response.statusCode == 200) {
        // Successfully created instance
        print('Data submitted successfully');
      } else {
        // Handle the error
        print('Failed to submit data');
      }
    } catch (error) {
      // Handle any errors that occur during the request
      print('Error occurred: $error');
    }
  }

